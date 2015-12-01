class Cart < ActiveRecord::Base
  has_many :itens_cart

  def preco_total
    # convert to array so it doesn't try to do sum on database directly
    itens_cart.to_a.sum(&:full_price)
  end

  def paypal_encrypted(return_url, notify_url)
    values = {
      :business => ENV["paypal_email"],
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :notify_url => notify_url,
      :cert_id => ENV["paypal_cert_id"],
      :currency_code => 'CAD'
    }
    itens_cart.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.preco,
        "item_name_#{index+1}" => item.produto.nome,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => 1
      })
    end
    encrypt_for_paypal(values)
  end
  
  PAYPAL_CERT_PEM = File.read("#{Rails.root}/certs/paypal_cert.pem")
  APP_CERT_PEM = File.read("#{Rails.root}/certs/app_cert.pem")
  APP_KEY_PEM = File.read("#{Rails.root}/certs/app_key.pem")

  def encrypt_for_paypal(values)
    signed = OpenSSL::PKCS7::sign(OpenSSL::X509::Certificate.new(APP_CERT_PEM), OpenSSL::PKey::RSA.new(APP_KEY_PEM, ''), values.map { |k, v| "#{k}=#{v}" }.join("\n"), [], OpenSSL::PKCS7::BINARY)
    OpenSSL::PKCS7::encrypt([OpenSSL::X509::Certificate.new(PAYPAL_CERT_PEM)], signed.to_der, OpenSSL::Cipher::Cipher::new("DES3"), OpenSSL::PKCS7::BINARY).to_s.gsub("\n", "")
  end
end

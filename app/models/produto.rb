class Produto < ActiveRecord::Base
  validates :nome, length: {minimum: 5, maximum: 40}, allow_blank: false
  validates :descricao, length: {minimum: 200, maximum: 7000}, allow_blank: false
  validates_presence_of [:price]


  def paypal_url(return_url)
    values = {
      :business => 'filipe.torqueto_api1.gmail.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id
    }
    line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => produto.price,
        "item_name_#{index+1}" => produto.nome,
        "item_number_#{index+1}" => produto.id,
        "quantity_#{index+1}" => 1
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end  
end
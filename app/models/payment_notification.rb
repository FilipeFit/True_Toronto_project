class PaymentNotification < ActiveRecord::Base
  belongs_to :cart
  serialize :params
  after_create :mark_cart_as_purchased

  private


  def mark_cart_as_purchased
    if status == "Completed" && params[:secret] == ENV["paypal_secret"] &&
        params[:receiver_email] == ENV["paypal_email"] &&
        params[:mc_gross] == cart.preco_total.to_s && params[:mc_currency] == "CAD"

      cart = Cart.find(cart_id)
      cart.update_attribute(:purchased_at, Time.now)
      cart.itens_cart[0].user.cliente.update_attribute(:ativo, true)

      PaymentMailer.payment_confirmation(cart.itens_cart[0].user).deliver
      
    end
  end
end

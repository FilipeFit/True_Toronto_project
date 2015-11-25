class PaymentNotificationController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    PaymentNotification.create!(:params => params, :cart_id => params[:invoice], :status => params[:payment_status], :transaction_id => params[:txn_id])
    render :nothing => true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_notification
      @payment_notification = PaymentNotification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_payment_notification
      params.require(:payment_notification).permit(:params, :cart_id, :transaction_id, :status)
    end  
end

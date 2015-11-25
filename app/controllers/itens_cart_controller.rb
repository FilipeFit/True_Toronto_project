class ItensCartController < ApplicationController
  
  before_action :authenticate_user!

  def create

    @produto = Produto.find(params[:produto_id])

    begin
      @itens_cart = ItensCart.create!(:cart => current_cart, :produto => @produto, :preco => @produto.price, :user_id => current_user.id)
      flash[:notice] = "Incluido #{@produto.nome} ao carrinho!"
    rescue ActiveRecord::RecordInvalid
      flash[:notice] = "Produto #{@produto.nome} ja Incluído!"
    end

    redirect_to current_cart_path
  end

  def limpar
    @itens_cart = nil
    @current_cart = nil
    session[:cart_id] = nil
    redirect_to current_cart_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itens_cart
      @itens_cart = ItensCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itens_cart_params
      params.require(:itensCart).permit(:produto_id, :cart_id, :preco, :user_id)
    end
end

class CartController < ApplicationController

  before_action :authenticate_user!, except: [:index]

  def add
    id = params[:id]
    @produto = Produto.find(params[:id])
    #if the cart has already been created, use the existing cart else create a new one
    if session[:cart]
      cart = session[:cart]
    else
      session[:cart] = {}
      cart = session[:cart]
    end
    #if the product has already added to the cart, give a user a message that the product is already in the cart
    if cart[id] then
      flash[:alert] = "O produto ja foi Incluído na sua compra"
    else
      cart[id] = 1
    end
    redirect_to :action => :index
  end

  def clearCart
    session[:cart] = nil
    redirect_to :action => :index
  end

  def index
    #if there is a cart, pass it to the page for display else pass an empty value
    if session[:cart] then
      @cart = session[:cart]
    else
      @cart = {}
    end
  end

end

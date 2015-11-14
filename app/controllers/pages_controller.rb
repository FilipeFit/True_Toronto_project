class PagesController < ApplicationController
  def about
  end

  def welcome
    @posts = Post.order(created_at: :desc).page(params[:page]).per_page(3)
  end

  def servicos
    @produtos = Produto.order(created_at: :desc)
  end
end

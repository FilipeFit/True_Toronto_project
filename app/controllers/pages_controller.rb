class PagesController < ApplicationController
  def about
  end

  def welcome
    @posts = Post.all
  end

  def servicos
    @produtos = Produto.all
  end
end

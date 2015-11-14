class Produto < ActiveRecord::Base
  validates_presence_of [:nome, :descricao, :price]
end

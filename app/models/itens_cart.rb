class ItensCart < ActiveRecord::Base
  belongs_to :cart
  belongs_to :produto
  belongs_to :user

  validates :produto, uniqueness: { scope: :cart,message: "Produto ja incluido" }

  def full_price
    preco
  end
end

class Produto < ActiveRecord::Base

  validates :nome, length: {minimum: 5, maximum: 40}, allow_blank: false
  validates :descricao, length: {minimum: 200, maximum: 7000}, allow_blank: false
  validates_presence_of [:price]
  
end
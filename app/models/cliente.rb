class Cliente < ActiveRecord::Base
  belongs_to :user

  validates :nome_completo, length: {minimum: 10, maximum: 250}, allow_blank: false
  validates :endereco_toronto, length: {minimum: 10, maximum: 300}, allow_blank: false
  validates :numero_voo, length: {minimum: 3, maximum: 100}, allow_blank: false
  validates :nome_escola, length: {minimum: 3, maximum: 300}, allow_blank: true
  validates :obs, length: {minimum: 0, maximum: 5000}, allow_blank: true   


  validates_presence_of [:user_id, :data_chegada, :data_hora_voo, :numero_voo, :tempo_permanencia]
end

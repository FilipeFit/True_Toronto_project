class ChangeProdutosLimits < ActiveRecord::Migration
  def change
    change_column(:produtos, :nome, :string, limit: 40)
    change_column(:produtos, :descricao, :text, limit: 7000)
  end
end
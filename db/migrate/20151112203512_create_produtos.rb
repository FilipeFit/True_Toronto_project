class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome
      t.text :descricao
      t.decimal :price

      t.timestamps null: false
    end
  end
end

class CreateItensCarts < ActiveRecord::Migration
  def change
    create_table :itens_carts do |t|
      t.integer :produto_id, null:false
      t.integer :cart_id, null: false
      t.decimal :preco, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end

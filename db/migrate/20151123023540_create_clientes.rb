class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :user_id, null:false
      t.string :nome_completo, null: false, limit: 250
      t.string :endereco_toronto, null: false, limit: 300
      t.date :data_chegada, null: false
      t.datetime :data_hora_voo, null: false
      t.string :numero_voo, null:false, limit: 100
      t.integer :tempo_permanencia, null:false
      t.date :data_nascimento, null: false
      t.string :nome_escola, limit: 300
      t.text :obs, limit: 5000
      t.boolean :ativo, default: false

      t.timestamps null: false
    end
  end
end

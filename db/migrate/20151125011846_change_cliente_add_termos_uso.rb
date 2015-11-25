class ChangeClienteAddTermosUso < ActiveRecord::Migration
  def change
    add_column :clientes, :concordo_termos_uso, :boolean, null: false, default: true
  end
end

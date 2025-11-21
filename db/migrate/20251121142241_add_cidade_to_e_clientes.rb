class AddCidadeToEClientes < ActiveRecord::Migration[7.2]
  def change
    add_column :e_clientes, :cidade, :string
    add_column :e_clientes, :estado, :string
  end
end

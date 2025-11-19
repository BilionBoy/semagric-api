class CreateEClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :e_clientes do |t|
      t.references :e_expositor, null: false, foreign_key: true
      t.string :nome
      t.string :telefone
      t.string :email
      t.text :endereco
      t.string :interesse

      t.timestamps
    end
  end
end

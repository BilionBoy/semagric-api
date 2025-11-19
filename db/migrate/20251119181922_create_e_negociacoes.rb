class CreateENegociacoes < ActiveRecord::Migration[7.2]
  def change
    create_table :e_negociacoes do |t|
      t.references :e_expositor, null: false, foreign_key: true
      t.references :e_cliente, null: false, foreign_key: true
      t.string :item
      t.integer :quantidade
      t.decimal :valor
      t.datetime :data_hora
      t.string :status

      t.timestamps
    end
  end
end

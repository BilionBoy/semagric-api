class CreateETipoExpositores < ActiveRecord::Migration[7.2]
  def change
    create_table :e_tipo_expositores do |t|
      t.string :descricao

      t.timestamps
    end
  end
end

class CreateEExpositores < ActiveRecord::Migration[7.2]
  def change
    create_table :e_expositores do |t|
      t.references :e_evento, null: false, foreign_key: true
      t.references :e_tipo_expositor, null: false, foreign_key: true
      t.references :e_segmento, null: false, foreign_key: true
      t.string :status
      t.string :empresa
      t.string :cnpj
      t.string :nome_completo
      t.string :cpf
      t.string :responsavel
      t.string :email_contato
      t.string :telefone_contato
      t.string :cidade
      t.string :estado
      t.string :stand

      t.timestamps
    end
  end
end

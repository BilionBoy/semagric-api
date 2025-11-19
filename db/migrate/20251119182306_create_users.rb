class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.references :a_tipo_usuario,  foreign_key: true
      t.references :e_expositor,  foreign_key: true

      t.timestamps
    end
  end
end

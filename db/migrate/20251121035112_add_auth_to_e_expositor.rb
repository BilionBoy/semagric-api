class AddAuthToEExpositor < ActiveRecord::Migration[7.2]
  def change
    add_column :e_expositores, :password_digest, :string
  end
end

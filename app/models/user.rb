class User < ApplicationRecord
  belongs_to :a_tipo_usuario
  belongs_to :e_expositor, optional: true

  has_secure_password   # habilita password=, authenticate(), etc.

  validates :email, presence: true, uniqueness: true
end

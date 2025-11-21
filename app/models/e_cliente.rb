class ECliente < ApplicationRecord
  belongs_to :e_expositor

  validates :nome,        presence: true
  validates :telefone,   presence: true
  validates :email,      presence: true
  validates :interesse,  presence: true
  validates :cidade,     presence: false
  validates :estado,     presence: false
end

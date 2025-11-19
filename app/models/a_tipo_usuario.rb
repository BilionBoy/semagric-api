class ATipoUsuario < ApplicationRecord

  validates :descricao, presence: true
end

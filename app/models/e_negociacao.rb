class ENegociacao < ApplicationRecord
  belongs_to :e_expositor
  belongs_to :e_cliente
end

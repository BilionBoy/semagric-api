class EExpositor < ApplicationRecord
  belongs_to :e_evento
  belongs_to :e_tipo_expositor
  belongs_to :e_segmento
end

# frozen_string_literal: true

class ESegmento < ApplicationRecord
  validates :descricao, presence: true
end

# frozen_string_literal: true

class EEvento < ApplicationRecord
  
  validates :nome, :ano, :data_inicio, :data_fim, :created_at, :updated_at, presence: true
  
end

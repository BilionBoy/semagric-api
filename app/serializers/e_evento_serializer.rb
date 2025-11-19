# frozen_string_literal: true

class EEventoSerializer < ActiveModel::Serializer
  attributes :id, :nome, :ano, :data_inicio, :data_fim, :created_at, :updated_at
end

class ENegociacaoSerializer < ActiveModel::Serializer
  attributes :id, :item, :quantidade, :valor, :data_hora, :status
  has_one :e_expositor
  has_one :e_cliente
end

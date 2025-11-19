class EClienteSerializer < ActiveModel::Serializer
  attributes :id, :nome, :telefone, :email, :endereco, :interesse
  has_one :e_expositor
end

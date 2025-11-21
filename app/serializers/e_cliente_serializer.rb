class EClienteSerializer < ActiveModel::Serializer
  attributes :id,
             :nome,
             :telefone,
             :email,
             :endereco,
             :interesse,
             :cidade,
             :estado,
             :created_at,
             :updated_at

  has_one :e_expositor
end

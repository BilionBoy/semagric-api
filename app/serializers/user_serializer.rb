class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password_digest
  has_one :a_tipo_usuario
  has_one :e_expositor
end

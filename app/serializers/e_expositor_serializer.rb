class EExpositorSerializer < ActiveModel::Serializer
  attributes :id, :status, :empresa, :cnpj, :nome_completo, :cpf, :responsavel, :email_contato, :telefone_contato, :cidade, :estado, :stand
  has_one :e_evento
  has_one :e_tipo_expositor
  has_one :e_segmento
end

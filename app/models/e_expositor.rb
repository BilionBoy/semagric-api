class EExpositor < ApplicationRecord
  belongs_to :e_evento
  belongs_to :e_tipo_expositor
  belongs_to :e_segmento

  has_secure_password

  before_validation :normalize_documents

  validates :empresa,          presence: true, if: :juridica?
  validates :cnpj,             presence: true, if: :juridica?
  validates :nome_completo,    presence: true, if: :fisica?
  validates :cpf,              presence: true, if: :fisica?

  validates :responsavel,      presence: true
  validates :email_contato,    presence: true
  validates :telefone_contato, presence: true
  validates :cidade, :estado,  presence: true
  validates :status,           presence: true

  # ✅ senha OBRIGATÓRIA só na criação
  validates :password, presence: true, on: :create

  def juridica?
    e_tipo_expositor_id == 2
  end

  def fisica?
    e_tipo_expositor_id == 1
  end

  def normalize_documents
    self.cnpj = cnpj.gsub(/\D/, "") if cnpj.present?
    self.cpf  = cpf.gsub(/\D/, "") if cpf.present?
  end
end

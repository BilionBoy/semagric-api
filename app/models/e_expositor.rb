class EExpositor < ApplicationRecord
  belongs_to :e_evento
  belongs_to :e_tipo_expositor
  belongs_to :e_segmento

  has_secure_password validations: false

  before_validation :normalize_documents

  validates :password,                       presence: true, on: :update
  validates :empresa,                        presence: true, if: :juridica?
  validates :cnpj,                           presence: true, if: :juridica?
  validates :nome_completo,                  presence: true, if: :fisica?
  validates :cpf,                            presence: true, if: :fisica?
  validates :responsavel,                    presence: true
  validates :email_contato,                  presence: true
  validates :telefone_contato,               presence: true
  validates :cidade, :estado,                presence: true
  validates :status,                         presence: true

  private

  def juridica?
    e_tipo_expositor_id == 2
  end

  def fisica?
    e_tipo_expositor_id == 1
  end

  def normalize_documents
    if cnpj.present?
      self.cnpj = cnpj.gsub(/\D/, "")
    end

    if cpf.present?
      self.cpf = cpf.gsub(/\D/, "")
    end
  end
end

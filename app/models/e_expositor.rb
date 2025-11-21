class EExpositor < ApplicationRecord
  belongs_to :e_evento
  belongs_to :e_tipo_expositor
  belongs_to :e_segmento


  before_validation :normalize_documents

  # Pessoa Jurídica (id = 2)
  validates :empresa, presence: true, if: :juridica?
  validates :cnpj, presence: true, if: :juridica?

  # Pessoa Física (id = 1)
  validates :nome_completo, presence: true, if: :fisica?
  validates :cpf, presence: true, if: :fisica?

  validates :responsavel, :email_contato, :telefone_contato,
            :cidade, :estado, :status, presence: true

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

require "test_helper"

class EExpositoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_expositor = e_expositores(:one)
  end

  test "should get index" do
    get e_expositores_url, as: :json
    assert_response :success
  end

  test "should create e_expositor" do
    assert_difference("EExpositor.count") do
      post e_expositores_url, params: { e_expositor: { cidade: @e_expositor.cidade, cnpj: @e_expositor.cnpj, cpf: @e_expositor.cpf, e_evento_id: @e_expositor.e_evento_id, e_segmento_id: @e_expositor.e_segmento_id, e_tipo_expositor_id: @e_expositor.e_tipo_expositor_id, email_contato: @e_expositor.email_contato, empresa: @e_expositor.empresa, estado: @e_expositor.estado, nome_completo: @e_expositor.nome_completo, responsavel: @e_expositor.responsavel, stand: @e_expositor.stand, status: @e_expositor.status, telefone_contato: @e_expositor.telefone_contato } }, as: :json
    end

    assert_response :created
  end

  test "should show e_expositor" do
    get e_expositor_url(@e_expositor), as: :json
    assert_response :success
  end

  test "should update e_expositor" do
    patch e_expositor_url(@e_expositor), params: { e_expositor: { cidade: @e_expositor.cidade, cnpj: @e_expositor.cnpj, cpf: @e_expositor.cpf, e_evento_id: @e_expositor.e_evento_id, e_segmento_id: @e_expositor.e_segmento_id, e_tipo_expositor_id: @e_expositor.e_tipo_expositor_id, email_contato: @e_expositor.email_contato, empresa: @e_expositor.empresa, estado: @e_expositor.estado, nome_completo: @e_expositor.nome_completo, responsavel: @e_expositor.responsavel, stand: @e_expositor.stand, status: @e_expositor.status, telefone_contato: @e_expositor.telefone_contato } }, as: :json
    assert_response :success
  end

  test "should destroy e_expositor" do
    assert_difference("EExpositor.count", -1) do
      delete e_expositor_url(@e_expositor), as: :json
    end

    assert_response :no_content
  end
end

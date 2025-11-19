require "test_helper"

class ENegociacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_negociacao = e_negociacoes(:one)
  end

  test "should get index" do
    get e_negociacoes_url, as: :json
    assert_response :success
  end

  test "should create e_negociacao" do
    assert_difference("ENegociacao.count") do
      post e_negociacoes_url, params: { e_negociacao: { data_hora: @e_negociacao.data_hora, e_cliente_id: @e_negociacao.e_cliente_id, e_expositor_id: @e_negociacao.e_expositor_id, item: @e_negociacao.item, quantidade: @e_negociacao.quantidade, status: @e_negociacao.status, valor: @e_negociacao.valor } }, as: :json
    end

    assert_response :created
  end

  test "should show e_negociacao" do
    get e_negociacao_url(@e_negociacao), as: :json
    assert_response :success
  end

  test "should update e_negociacao" do
    patch e_negociacao_url(@e_negociacao), params: { e_negociacao: { data_hora: @e_negociacao.data_hora, e_cliente_id: @e_negociacao.e_cliente_id, e_expositor_id: @e_negociacao.e_expositor_id, item: @e_negociacao.item, quantidade: @e_negociacao.quantidade, status: @e_negociacao.status, valor: @e_negociacao.valor } }, as: :json
    assert_response :success
  end

  test "should destroy e_negociacao" do
    assert_difference("ENegociacao.count", -1) do
      delete e_negociacao_url(@e_negociacao), as: :json
    end

    assert_response :no_content
  end
end

require "test_helper"

class EClientesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_cliente = e_clientes(:one)
  end

  test "should get index" do
    get e_clientes_url, as: :json
    assert_response :success
  end

  test "should create e_cliente" do
    assert_difference("ECliente.count") do
      post e_clientes_url, params: { e_cliente: { e_expositor_id: @e_cliente.e_expositor_id, email: @e_cliente.email, endereco: @e_cliente.endereco, interesse: @e_cliente.interesse, nome: @e_cliente.nome, telefone: @e_cliente.telefone } }, as: :json
    end

    assert_response :created
  end

  test "should show e_cliente" do
    get e_cliente_url(@e_cliente), as: :json
    assert_response :success
  end

  test "should update e_cliente" do
    patch e_cliente_url(@e_cliente), params: { e_cliente: { e_expositor_id: @e_cliente.e_expositor_id, email: @e_cliente.email, endereco: @e_cliente.endereco, interesse: @e_cliente.interesse, nome: @e_cliente.nome, telefone: @e_cliente.telefone } }, as: :json
    assert_response :success
  end

  test "should destroy e_cliente" do
    assert_difference("ECliente.count", -1) do
      delete e_cliente_url(@e_cliente), as: :json
    end

    assert_response :no_content
  end
end

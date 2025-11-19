require "test_helper"

class ETipoExpositoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @e_tipo_expositor = e_tipo_expositores(:one)
  end

  test "should get index" do
    get e_tipo_expositores_url, as: :json
    assert_response :success
  end

  test "should create e_tipo_expositor" do
    assert_difference("ETipoExpositor.count") do
      post e_tipo_expositores_url, params: { e_tipo_expositor: { descricao: @e_tipo_expositor.descricao } }, as: :json
    end

    assert_response :created
  end

  test "should show e_tipo_expositor" do
    get e_tipo_expositor_url(@e_tipo_expositor), as: :json
    assert_response :success
  end

  test "should update e_tipo_expositor" do
    patch e_tipo_expositor_url(@e_tipo_expositor), params: { e_tipo_expositor: { descricao: @e_tipo_expositor.descricao } }, as: :json
    assert_response :success
  end

  test "should destroy e_tipo_expositor" do
    assert_difference("ETipoExpositor.count", -1) do
      delete e_tipo_expositor_url(@e_tipo_expositor), as: :json
    end

    assert_response :no_content
  end
end

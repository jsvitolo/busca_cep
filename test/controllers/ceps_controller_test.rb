require 'test_helper'

class CepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cep = ceps(:one)
  end

  test "should get index" do
    get ceps_url
    assert_response :success
  end

  test "should show cep" do
    get cep_url(@cep)
    assert_response :success
  end

  test "should update cep" do
    patch cep_url(@cep), params: { cep: { bairro: @cep.bairro, cep: @cep.cep, cidade: @cep.cidade, endereco: @cep.endereco, estado: @cep.estado } }
    assert_response 200
  end

  test "should destroy cep" do
    assert_difference('Cep.count', -1) do
      delete cep_url(@cep)
    end

    assert_response 204
  end
end

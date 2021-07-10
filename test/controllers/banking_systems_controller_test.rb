require "test_helper"

class BankingSystemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banking_system = banking_systems(:one)
  end

  test "should get index" do
    get banking_systems_url
    assert_response :success
  end

  test "should get new" do
    get new_banking_system_url
    assert_response :success
  end

  test "should create banking_system" do
    assert_difference('BankingSystem.count') do
      post banking_systems_url, params: { banking_system: { current_balance: @banking_system.current_balance, email: @banking_system.email, name: @banking_system.name } }
    end

    assert_redirected_to banking_system_url(BankingSystem.last)
  end

  test "should show banking_system" do
    get banking_system_url(@banking_system)
    assert_response :success
  end

  test "should get edit" do
    get edit_banking_system_url(@banking_system)
    assert_response :success
  end

  test "should update banking_system" do
    patch banking_system_url(@banking_system), params: { banking_system: { current_balance: @banking_system.current_balance, email: @banking_system.email, name: @banking_system.name } }
    assert_redirected_to banking_system_url(@banking_system)
  end

  test "should destroy banking_system" do
    assert_difference('BankingSystem.count', -1) do
      delete banking_system_url(@banking_system)
    end

    assert_redirected_to banking_systems_url
  end
end

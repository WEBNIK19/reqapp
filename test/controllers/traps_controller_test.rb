require 'test_helper'

class TrapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trap = traps(:one)
  end

  test "should get index" do
    get traps_url
    assert_response :success
  end

  test "should get new" do
    get new_trap_url
    assert_response :success
  end

  test "should create trap" do
    assert_difference('Trap.count') do
      post traps_url, params: { trap: { name: @trap.name } }
    end

    assert_redirected_to trap_url(Trap.last)
  end

  test "should show trap" do
    get trap_url(@trap)
    assert_response :success
  end

  test "should get edit" do
    get edit_trap_url(@trap)
    assert_response :success
  end

  test "should update trap" do
    patch trap_url(@trap), params: { trap: { name: @trap.name } }
    assert_redirected_to trap_url(@trap)
  end

  test "should destroy trap" do
    assert_difference('Trap.count', -1) do
      delete trap_url(@trap)
    end

    assert_redirected_to traps_url
  end
end

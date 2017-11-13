require 'test_helper'

class PosUsrLorriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pos_usr_lorry = pos_usr_lorries(:one)
  end

  test "should get index" do
    get pos_usr_lorries_url
    assert_response :success
  end

  test "should get new" do
    get new_pos_usr_lorry_url
    assert_response :success
  end

  test "should create pos_usr_lorry" do
    assert_difference('PosUsrLorry.count') do
      post pos_usr_lorries_url, params: { pos_usr_lorry: { image: @pos_usr_lorry.image, number: @pos_usr_lorry.number, pos_usr_transpoter_id: @pos_usr_lorry.pos_usr_transpoter_id, reg_number: @pos_usr_lorry.reg_number } }
    end

    assert_redirected_to pos_usr_lorry_url(PosUsrLorry.last)
  end

  test "should show pos_usr_lorry" do
    get pos_usr_lorry_url(@pos_usr_lorry)
    assert_response :success
  end

  test "should get edit" do
    get edit_pos_usr_lorry_url(@pos_usr_lorry)
    assert_response :success
  end

  test "should update pos_usr_lorry" do
    patch pos_usr_lorry_url(@pos_usr_lorry), params: { pos_usr_lorry: { image: @pos_usr_lorry.image, number: @pos_usr_lorry.number, pos_usr_transpoter_id: @pos_usr_lorry.pos_usr_transpoter_id, reg_number: @pos_usr_lorry.reg_number } }
    assert_redirected_to pos_usr_lorry_url(@pos_usr_lorry)
  end

  test "should destroy pos_usr_lorry" do
    assert_difference('PosUsrLorry.count', -1) do
      delete pos_usr_lorry_url(@pos_usr_lorry)
    end

    assert_redirected_to pos_usr_lorries_url
  end
end

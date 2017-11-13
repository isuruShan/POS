require 'test_helper'

class PosUsrTranspotersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pos_usr_transpoter = pos_usr_transpoters(:one)
  end

  test "should get index" do
    get pos_usr_transpoters_url
    assert_response :success
  end

  test "should get new" do
    get new_pos_usr_transpoter_url
    assert_response :success
  end

  test "should create pos_usr_transpoter" do
    assert_difference('PosUsrTranspoter.count') do
      post pos_usr_transpoters_url, params: { pos_usr_transpoter: { address: @pos_usr_transpoter.address, email: @pos_usr_transpoter.email, name: @pos_usr_transpoter.name, owner_name: @pos_usr_transpoter.owner_name, vat_reg_num: @pos_usr_transpoter.vat_reg_num } }
    end

    assert_redirected_to pos_usr_transpoter_url(PosUsrTranspoter.last)
  end

  test "should show pos_usr_transpoter" do
    get pos_usr_transpoter_url(@pos_usr_transpoter)
    assert_response :success
  end

  test "should get edit" do
    get edit_pos_usr_transpoter_url(@pos_usr_transpoter)
    assert_response :success
  end

  test "should update pos_usr_transpoter" do
    patch pos_usr_transpoter_url(@pos_usr_transpoter), params: { pos_usr_transpoter: { address: @pos_usr_transpoter.address, email: @pos_usr_transpoter.email, name: @pos_usr_transpoter.name, owner_name: @pos_usr_transpoter.owner_name, vat_reg_num: @pos_usr_transpoter.vat_reg_num } }
    assert_redirected_to pos_usr_transpoter_url(@pos_usr_transpoter)
  end

  test "should destroy pos_usr_transpoter" do
    assert_difference('PosUsrTranspoter.count', -1) do
      delete pos_usr_transpoter_url(@pos_usr_transpoter)
    end

    assert_redirected_to pos_usr_transpoters_url
  end
end

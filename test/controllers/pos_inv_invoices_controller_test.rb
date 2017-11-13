require 'test_helper'

class PosInvInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pos_inv_invoice = pos_inv_invoices(:one)
  end

  test "should get index" do
    get pos_inv_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_pos_inv_invoice_url
    assert_response :success
  end

  test "should create pos_inv_invoice" do
    assert_difference('PosInvInvoice.count') do
      post pos_inv_invoices_url, params: { pos_inv_invoice: { billing_date: @pos_inv_invoice.billing_date, customer: @pos_inv_invoice.customer, delivery_date: @pos_inv_invoice.delivery_date, gatepass_number: @pos_inv_invoice.gatepass_number, invoice_num: @pos_inv_invoice.invoice_num, rate_of_transporter: @pos_inv_invoice.rate_of_transporter } }
    end

    assert_redirected_to pos_inv_invoice_url(PosInvInvoice.last)
  end

  test "should show pos_inv_invoice" do
    get pos_inv_invoice_url(@pos_inv_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_pos_inv_invoice_url(@pos_inv_invoice)
    assert_response :success
  end

  test "should update pos_inv_invoice" do
    patch pos_inv_invoice_url(@pos_inv_invoice), params: { pos_inv_invoice: { billing_date: @pos_inv_invoice.billing_date, customer: @pos_inv_invoice.customer, delivery_date: @pos_inv_invoice.delivery_date, gatepass_number: @pos_inv_invoice.gatepass_number, invoice_num: @pos_inv_invoice.invoice_num, rate_of_transporter: @pos_inv_invoice.rate_of_transporter } }
    assert_redirected_to pos_inv_invoice_url(@pos_inv_invoice)
  end

  test "should destroy pos_inv_invoice" do
    assert_difference('PosInvInvoice.count', -1) do
      delete pos_inv_invoice_url(@pos_inv_invoice)
    end

    assert_redirected_to pos_inv_invoices_url
  end
end

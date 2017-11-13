json.extract! pos_inv_invoice, :id, :invoice_num, :gatepass_number, :billing_date, :delivery_date, :rate_of_transporter, :customer, :created_at, :updated_at
json.url pos_inv_invoice_url(pos_inv_invoice, format: :json)

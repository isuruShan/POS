class CreatePosInvInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_inv_invoices do |t|
      t.integer :invoice_num
      t.integer :gatepass_number
      t.date :billing_date
      t.date :delivery_date
      t.integer :rate_of_transporter
      t.string :customer
      t.boolean :return, default: false
      t.references :pos_usr_lorry, foreign_key: true
      t.float :amount
      t.float :tax
      t.float :tax_percentage, default:15
      t.boolean :money_recieved
      t.boolean :money_transfered
      t.string :tax_destination
      t.references :pos_usr_user
      t.timestamps
    end
  end
end

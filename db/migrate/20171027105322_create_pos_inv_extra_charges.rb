class CreatePosInvExtraCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_inv_extra_charges do |t|
      t.string :name
      t.float :amount
      t.references :pos_inv_invoice, foreign_key: true

      t.timestamps
    end
  end
end

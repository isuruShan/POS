class CreatePosInvDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_inv_destinations do |t|
      t.string :name
      t.references :pos_inv_invoice, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePosUsrLorryOwners < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_usr_lorry_owners do |t|
      t.string :name
      t.integer :nic
      t.integer :account_number
      t.string :phone
      t.string :image
      t.references :pos_usr_lorry, foreign_key: true

      t.timestamps
    end
  end
end

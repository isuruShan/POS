class CreatePosUsrTranspoters < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_usr_transpoters do |t|
      t.string :name
      t.string :owner_name
      t.string :address
      t.string :email
      t.integer :vat_reg_num

      t.timestamps
    end
  end
end

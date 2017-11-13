class CreatePosUsrLorries < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_usr_lorries do |t|
      t.integer :reg_number
      t.string :number
      t.string :image
      t.references :pos_usr_transpoter, foreign_key: true
      t.references :pos_usr_lorry_category, foreign_key: true
      t.timestamps
    end
  end
end

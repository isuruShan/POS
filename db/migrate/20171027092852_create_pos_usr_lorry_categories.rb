class CreatePosUsrLorryCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :pos_usr_lorry_categories do |t|
      t.string :category
      t.float :city_charge
      t.float :milage_charge
      t.integer :fridge_capacity

      t.timestamps
    end
  end
end

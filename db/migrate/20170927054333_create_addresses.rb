class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :building_name
      t.string :address1
      t.string :address2
      t.integer :pincode
      t.integer :locality_id
      t.integer :user_id

      t.timestamps
    end
  end
end

class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :address_id
      t.integer :time_slot_id
      t.integer :delivery_boy_id
      t.string :status
      t.integer :payment_id

      t.timestamps
    end
  end
end

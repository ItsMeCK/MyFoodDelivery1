class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :food_item_id
      t.decimal :total
      t.integer :quantity
      t.timestamps
    end
  end
end

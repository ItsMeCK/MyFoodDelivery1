class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.string :item_image
      t.string :food_type
      t.integer :locality_id

      t.timestamps
    end
  end
end

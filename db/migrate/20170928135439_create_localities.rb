class CreateLocalities < ActiveRecord::Migration[5.0]
  def change
    create_table :localities do |t|
      t.string :locality_name

      t.timestamps
    end
  end
end

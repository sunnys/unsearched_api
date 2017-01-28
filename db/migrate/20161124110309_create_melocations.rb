class CreateMelocations < ActiveRecord::Migration[5.0]
  def change
    create_table :melocations do |t|
      t.integer :location_id
      t.integer :my_memory_id
      t.timestamps
    end
  end
end

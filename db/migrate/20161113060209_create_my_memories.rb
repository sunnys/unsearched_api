class CreateMyMemories < ActiveRecord::Migration[5.0]
  def change
    create_table :my_memories do |t|
      t.integer :user_id
      t.integer :theme_id
      t.integer :location_id
      t.string :title
      t.text :description
      t.date :memory_date

      t.timestamps
    end
  end
end

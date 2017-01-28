class AddColumnImageToMyMemories < ActiveRecord::Migration[5.0]
  def change
    add_column :my_memories, :image, :string
  end
end

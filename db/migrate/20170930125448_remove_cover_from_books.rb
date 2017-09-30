class RemoveCoverFromBooks < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :cover, :string
    add_column :books, :image_id, :integer
    add_index  :books, :image_id
  end
end

class AddAuthorNameToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :author_name, :string
    remove_column :books, :author_id, :string
  end
end

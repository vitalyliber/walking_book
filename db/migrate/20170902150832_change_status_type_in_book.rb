class ChangeStatusTypeInBook < ActiveRecord::Migration[5.1]
  def change
    remove_column :books, :status
    add_column :books, :status, :integer, default: 0
    remove_column :books, :category
    add_column :books, :category, :integer, default: 0
    add_reference :books, :user, index: true
  end
end

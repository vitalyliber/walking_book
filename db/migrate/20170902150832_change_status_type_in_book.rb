class ChangeStatusTypeInBook < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :status, :integer, default: 0
    change_column :books, :category, :integer, default: 0
    add_reference :books, :user, index: true
  end
end

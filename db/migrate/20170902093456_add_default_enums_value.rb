class AddDefaultEnumsValue < ActiveRecord::Migration[5.1]
  def up
    change_column :books, :status, :string, :default => 'available'
  end
end

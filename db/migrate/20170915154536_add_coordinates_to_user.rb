class AddCoordinatesToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_index  :users, [:lat, :lng]
    add_column :users, :address, :string
  end
end

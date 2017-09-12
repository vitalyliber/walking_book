class AddCoordinatesToBook < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :lat, :float
    add_column :books, :lng, :float
    add_index  :books, [:lat, :lng]
  end
end

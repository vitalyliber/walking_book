class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end

class Book < ApplicationRecord

  enum status: [:available, :busy]
  enum category: [:fiction, :education, :children, :other]

  belongs_to :author
  has_many   :histories
  has_many   :users, through: :histories

end

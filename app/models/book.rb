class Book < ApplicationRecord

  enum status: [:available, :busy]
  enum category: [:fiction, :education, :children, :other]

  belongs_to :author
  has_many   :histories
  has_many   :users, through: :histories

  validates_presence_of :title, :author_id

end

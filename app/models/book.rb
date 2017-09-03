class Book < ApplicationRecord

  enum status: [:available, :busy]
  enum category: [:fiction, :education, :children, :other]

  belongs_to :author
  belongs_to :user
  has_many   :histories
  has_many   :users, through: :histories

  validates_presence_of :title, :description, :category, :author_id

end

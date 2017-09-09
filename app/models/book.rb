class Book < ApplicationRecord

  enum status: [:available, :busy]
  enum category: [:fiction, :education, :children, :other]

  belongs_to :author
  belongs_to :user
  has_many   :histories
  has_many   :users, through: :histories

  validates_presence_of :title, :description, :category, :author_id

  after_update :create_history
  after_create :create_history

  mount_uploader :cover, CoverUploader

  private

  def create_history
    if user_id_changed?
      History.create(book: self, user: user)
    end
  end

end

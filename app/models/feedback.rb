class Feedback < ApplicationRecord

  belongs_to :user
  belongs_to :book

  validates_presence_of :user, :book
  validates :user, uniqueness: { scope: :book, message: "should happen once per book" }
end

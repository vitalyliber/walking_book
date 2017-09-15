class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :books

  validates_presence_of :first_name, :last_name

  after_update :update_books_coordinates

  private

  def update_books_coordinates
    if saved_change_to_lat? or saved_change_to_lng?
      books.update_all(lng: lng, lat: lat)
    end
  end

end

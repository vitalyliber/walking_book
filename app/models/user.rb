class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :histories
  has_many :books, through: :histories

  validates_presence_of :first_name

end

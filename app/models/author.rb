class Author < ApplicationRecord

  has_many :books

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of  :first_name, :last_name

end

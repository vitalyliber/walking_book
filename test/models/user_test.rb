require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should update books coordinates" do
    user = create :user

    book = Book.new
    book.title = 'New book'
    book.description = 'New book'
    book.author_name = 'Joanne Rowling'
    book.category = :fiction
    book.user = user

    # An user without coordinates can't create new book
    assert_equal false, book.save

    user.update lat: 54.8150676, lng: 83.3918063

    # The user with coordinates can create the book
    assert book.save


    new_lat = 55.0224099
    new_lng = 82.9544365

    user.update lat: new_lat, lng: new_lng

    # All user books must update after updating the user coordinates
    assert_equal new_lat, book.reload.lat
    assert_equal new_lng, book.reload.lng
  end
end

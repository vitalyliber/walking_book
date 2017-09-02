require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "should not save book without title" do
    book = Book.new
    author = create(:author)
    book.author = author
    assert_not book.save
  end

  test "should not save book without author" do
    book = Book.new
    book.title = 'New book'
    assert_not book.save
  end

end

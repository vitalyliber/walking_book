require 'test_helper'

class BookTest < ActiveSupport::TestCase

  test "should save book" do
    book = Book.new
    author = create :author
    book.title = 'New book'
    book.description = 'New book'
    book.author = author
    book.category = :fiction
    book.user = create :user
    assert book.save
    assert History.first.present?

    # this book took other user

    book.update user: create(:user)
    p History.all.count
    assert_equal History.all.count, 2
  end

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

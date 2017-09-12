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

  test 'should find 2 books within 30 kms and three books within 40kms' do
    user = create :user
    create :book, lat: 54.8384426, lng: 83.1002884, user: user #Berdsk
    create :book, lat: 54.7575249, lng: 83.0983643, user: user #Akadem
    create :book, lat: 55.0228552, lng: 82.9303769, user: user #Novosibirsk

    assert_equal Book.within(30, :origin => [54.7536625,83.1020964]).count, 2
    assert_equal Book.within(40, :origin => [54.7536625,83.1020964]).count, 3
  end

end

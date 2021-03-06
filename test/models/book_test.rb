require 'test_helper'

class BookTest < ActiveSupport::TestCase

  setup do
    @image = create :image
  end

  test "should save book" do
    book = Book.new
    book.title = 'New book'
    book.description = 'New book'
    book.author_name = 'Joanne Rowling'
    book.category = :fiction
    book.user = create :user, lat: 0.0, lng: 0.0
    book.image = @image
    assert book.save

    assert History.first.present?

    # this book took other user
    book.update user: create(:user, lat: 0.0, lng: 0.0)
    assert_equal 2, History.all.count
  end

  test "should not save book without title" do
    book = Book.new
    book.author_name = 'Joanne Rowling'
    assert_not book.save
  end

  test "should not save book without author" do
    book = Book.new
    book.title = 'New book'
    assert_not book.save
  end

  test 'should find 2 books within 30 kms and three books within 40kms' do
    user_from_berdsk = create :user, lat: 54.8384426, lng: 83.1002884
    user_from_akadem = create :user, lat: 54.7575249, lng: 83.0983643
    user_from_nsk = create :user, lat: 55.0228552, lng: 82.9303769
    create :book, image: @image, user: user_from_berdsk #Berdsk
    create :book, image: @image, user: user_from_akadem #Akadem
    create :book, image: @image, user: user_from_nsk #Novosibirsk

    assert_equal 2, Book.within(30, :origin => [54.7536625,83.1020964]).count
    assert_equal 3, Book.within(40, :origin => [54.7536625,83.1020964]).count
  end

  test 'should search books by title and author' do
    user = create :user, lat: 0.0, lng: 0.0

    create :book, image: @image, user: user, title: 'Stranger Things', author_name: 'Duffer Brothers'
    create :book, image: @image, user: user, title: 'Macabre stories', author_name: 'Howard Phillips Lovecraft'
    create :book, image: @image, user: user, title: 'The Call of Cthulhu', author_name: 'Howard Phillips Lovecraft'

    # search by title
    assert_equal 1, Book.search_by_book_info('Stranger').count
    assert_equal 1, Book.search_by_book_info('Macabre stories').count

    # search by author
    assert_equal 2, Book.search_by_book_info('Lovecraft').count
    assert_equal 1, Book.search_by_book_info('Duffer Brothers').count
  end

end

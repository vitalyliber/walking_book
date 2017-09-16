FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book#{n}"}
    sequence(:author_name) {|n| "Joanne Rowling#{n}"}
    category 'fiction'
    description 'Awesome book'
    status 'available'
  end
end
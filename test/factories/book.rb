FactoryGirl.define do
  factory :book do
    sequence(:title) {|n| "Book#{n}"}
    category 'fiction'
    description 'Awesome book'
    status 'available'

    association :author
  end
end
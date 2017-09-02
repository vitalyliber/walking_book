FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "user #{n}"}
    last_name 'for tests'
    sequence(:email) {|n| "user#{n}@example.com"}
    password 'password'
    password_confirmation 'password'

    trait :confirmed do
      confirmed_at DateTime.now
    end
  end
end
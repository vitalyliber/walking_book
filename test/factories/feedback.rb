FactoryGirl.define do
  factory :feedback do
    text 'I read it'

    association :user
    association :book
  end
end
FactoryGirl.define do
  factory :author do
    sequence(:first_name) {|n| "Author#{n}"}
    sequence(:last_name) {|n| "Lastname#{n}"}

  end
end
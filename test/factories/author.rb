FactoryGirl.define do
  factory :author do
    sequence(:first_name) {|n| "Author#{n}"}
    sequence(:last_name) {|n| "Lastname#{n}"}

    books {[build(:book, title: 'First'), build(:book, title: 'Second')]}
  end
end
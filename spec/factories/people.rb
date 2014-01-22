# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    name "MyString"
    state_id 1
    salary 1
    date_of_birth "2014-01-23"
    postcode 1
  end
end

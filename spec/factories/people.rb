# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
    first_name "Alice"
    last_name "Smith"
    user
  end
end

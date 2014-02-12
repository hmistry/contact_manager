# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :email_address do
    address "MyString"
    contact_id 1
    contact_type "person"
  end
end

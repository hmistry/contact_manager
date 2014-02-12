# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :phone_number do
    number "555-123-6789"
    contact_id 1
    contact_type "person"
  end
end

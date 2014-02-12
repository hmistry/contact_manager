# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    provider "twitter"
    sequence(:uid) { |n| "#{n}"}
    name "Sample User"
  end
end

# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "test#{n}@test.com"}
    password 'test1234'
    phone '1234567891'
  end
end

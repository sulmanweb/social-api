require 'faker'
FactoryBot.define do
  factory :user do
    username { Faker::Alphanumeric.unique.alpha(number: 10) }
    email { Faker::Internet.unique.email }
    password { "abcd@1234" }
    first_name { Faker::Alphanumeric.alpha(number: 5) }
    last_name { Faker::Alphanumeric.alpha(number: 5) }
  end
end

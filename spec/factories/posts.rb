FactoryBot.define do
  factory :post do
    association :user
    content { "MyText" }
    status { true }
  end
end

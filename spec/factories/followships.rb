FactoryBot.define do
  factory :followship do
    association :follower, factory: :user
    association :followee, factory: :user
    status { true }
  end
end

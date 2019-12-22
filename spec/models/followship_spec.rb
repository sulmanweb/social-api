require 'rails_helper'

RSpec.describe Followship, type: :model do
  it "has a valid factory" do
    u1 = FactoryBot.create(:user)
    u2 = FactoryBot.create(:user)
    followship = FactoryBot.build(:followship, follower_id: u1.id, followee_id: u2.id)
    expect(followship.valid?).to be_truthy
  end
end

require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    user = FactoryBot.build(:user)
    expect(user.valid?).to be_truthy
  end

  describe "#follow" do
    it "makes user 1 to follow user 2" do
      u1 = FactoryBot.create(:user)
      u2 = FactoryBot.create(:user)
      expect { u1.follow(u2) }.to change { u1.followees.count }.by(1)
      expect { u2.follow(u1) }.to change { u1.followers.count }.by(1)
    end
  end

  describe "#unfollow" do
    it "makes user 1 to unfollow user 2" do
      u1 = FactoryBot.create(:user)
      u2 = FactoryBot.create(:user)
      u1.follow(u2)
      u2.follow(u1)
      expect { u1.unfollow(u2) }.to change { u1.followees.count }.by(-1)
      expect { u2.unfollow(u1) }.to change { u1.followers.count }.by(-1)
    end
  end
end

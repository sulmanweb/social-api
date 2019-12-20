require 'rails_helper'

RSpec.describe Post, type: :model do
  it "has a valid factory" do
    post = FactoryBot.build(:post)
    expect(post.valid?).to be_truthy
  end
end

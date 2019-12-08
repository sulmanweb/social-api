require 'rails_helper'

RSpec.describe Session, type: :model do
  it "has a valid factory" do
    session = FactoryBot.build(:session)
    expect(session.valid?).to be_truthy
  end
end

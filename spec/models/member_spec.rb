require 'rails_helper'

RSpec.describe Member, type: :model do
  let(:member) {FactoryGirl.create(:member)}

  it "is valid" do
    expect(member).to be_valid
  end

  it "has email attribute" do
    member.email = nil
    expect(member).not_to be_valid
  end

  it "has password attribute" do
    member.password = nil
    expect(member).not_to be_valid
  end
end

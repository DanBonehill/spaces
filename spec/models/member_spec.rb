require 'rails_helper'

RSpec.describe Member, type: :model do

  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:member)).to be_valid
    end

    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
  end
end

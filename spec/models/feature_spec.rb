require 'rails_helper'

RSpec.describe Feature, type: :model do
  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:feature)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).case_insensitive }
    it { should have_and_belong_to_many(:locations) }
  end
end

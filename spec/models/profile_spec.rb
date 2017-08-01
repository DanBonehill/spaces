require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:profile)).to be_valid
    end

    it { should validate_presence_of(:first_name)}
    it { should validate_presence_of(:last_name)}
    it { should validate_presence_of(:contact_number)}
    it { should validate_presence_of(:member_id)}
    it { should belong_to(:member) }
  end
end

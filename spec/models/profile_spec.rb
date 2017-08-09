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

    before do
      @member = Member.create(email: "dan@example.com", password: "Password")
      @profile = Profile.create(first_name: "Daniel", last_name: "Bonehill", contact_number: "07447921846", member: @member)
    end

    it "has a capitalized first name with at least 3 characters and no more than 20" do
      @profile.first_name = "a" * 2
      expect(@profile).not_to be_valid

      @profile.first_name = "a" * 21
      expect(@profile).not_to be_valid

      #unsure how to validate
      #@profile.first_name = "dANIEL"
      #expect(@profile.first_name).to eq("Daniel")
    end

    it "has a capitalized last name with at least 3 characters and no more than 30" do
      @profile.last_name = "a" * 2
      expect(@profile).not_to be_valid

      @profile.last_name = "a" * 31
      expect(@profile).not_to be_valid

      #unsure how to validate
      #@profile.last_name = "bONEHILL"
      #expect(@profile).not_to be_valid
    end

    it "has a full_name function" do
      expect(@profile.full_name).to eq("#{@profile.first_name} #{@profile.last_name}")
    end

    it "has a contact number with at least 10 characters and no more than 20" do
      @profile.contact_number = "0" * 9
      expect(@profile).not_to be_valid

      @profile.contact_number = "0" * 21
      expect(@profile).not_to be_valid
    end
  end
end

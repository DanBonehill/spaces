require 'rails_helper'

RSpec.describe Address, type: :model do
  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:address)).to be_valid
      expect(FactoryGirl.create(:address_with_lat_long)).to be_valid
    end

    it { should validate_presence_of(:line_1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:postcode) }

    it { should validate_numericality_of(:latitude) }
    it { should validate_numericality_of(:longitude) }

    it { should belong_to(:location) }

    before do
      @location = FactoryGirl.create(:location)
      @address = Address.create(
        line_1: "1 Churchill Place",
        line_2: "Canary Warf",
        city: "London",
        postcode: "E14 5HP",
        latitude: 51.5051715,
        longitude: -0.0143441,
        location: @location
      )
    end


    it "is valid with or without line 2 present" do
      expect(@address).to be_valid

      @address.line_2 = nil
      @address.save
      expect(@address).to be_valid
    end

    it "is valid with or without latitude" do
      expect(@address).to be_valid

      @address.latitude = nil
      @address.save
      expect(@address).to be_valid
    end

    it "is valid with or without longitude" do
      expect(@address).to be_valid

      @address.longitude = nil
      @address.save
      expect(@address).to be_valid
    end

    it "has line 1 with at least 5 characters and no more than 30" do
      @address.line_1 = "a" * 4
      expect(@address).not_to be_valid

      @address.line_1 = "a" * 31
      expect(@address).not_to be_valid
    end

    it "has line 2 with at least 5 characters and no more than 40" do
      @address.line_2 = "a" * 4
      expect(@address).not_to be_valid

      @address.line_2 = "a" * 41
      expect(@address).not_to be_valid
    end

    it "has a city with at least 5 characters and no more than 20" do
      @address.city = "a" * 4
      expect(@address).not_to be_valid

      @address.city = "a" * 21
      expect(@address).not_to be_valid
    end

    it "has a postcode with at least 6 characters and no more than 8" do
      @address.postcode = "a" * 5
      expect(@address).not_to be_valid

      @address.postcode = "a" * 9
      expect(@address).not_to be_valid
    end
  end
end

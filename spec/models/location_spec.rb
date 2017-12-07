require 'rails_helper'

RSpec.describe Location, type: :model do
  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:location)).to be_valid
      expect(FactoryGirl.create(:location_with_address)).to be_valid
      expect(FactoryGirl.create(:location_with_one_image)).to be_valid
      expect(FactoryGirl.create(:location_with_image_and_caption)).to be_valid
      expect(FactoryGirl.create(:location_with_images_and_address)).to be_valid
      expect(FactoryGirl.create(:location_with_features)).to be_valid
    end

    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:point_of_contact) }
    it { should validate_presence_of(:contact_number) }
    it { should validate_presence_of(:max_occupancy) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should have_one(:address)}
    it { should have_many(:images)}
    it { should have_and_belong_to_many(:features)}

    before do
      @location = Location.create(
        name: "Amazing Office Space",
        point_of_contact: "Tim Cook",
        contact_number: "07554823654",
        max_occupancy: 4,
        price: 30,
        description: "This is an amazing office space. I love it."
      )
    end

    it "has a name with at least 5 characters and no more than 30" do
      @location.name = "a" * 4
      expect(@location).not_to be_valid

      @location.name = "a" * 31
      expect(@location).not_to be_valid
    end

    it "has a point of contact with at least 3 characters and no more than 20" do
      @location.point_of_contact = "a" * 2
      expect(@location).not_to be_valid

      @location.point_of_contact = "a" * 21
      expect(@location).not_to be_valid
    end

    it "has a contact number with at least 10 characters and no more than 20" do
      @location.contact_number = "a" * 9
      expect(@location).not_to be_valid

      @location.contact_number = "a" * 21
      expect(@location).not_to be_valid
    end

    it "has a description with at least 10 characters and no more than 251" do
      @location.description = "a" * 9
      expect(@location).not_to be_valid

      @location.description = "a" * 251
      expect(@location).not_to be_valid
    end
  end
end

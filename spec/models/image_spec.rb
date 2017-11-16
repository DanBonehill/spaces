require 'rails_helper'

RSpec.describe Image, type: :model do
  describe "validations" do
    it "has valid factory" do
      expect(FactoryGirl.create(:image)).to be_valid
      expect(FactoryGirl.create(:image_with_caption)).to be_valid
    end

    it { should validate_presence_of(:location_id)}

    before do
      @image = FactoryGirl.create(:image_with_caption)
    end

    it "has a caption with at least 5 characters and no more than 50" do
      @image.caption = "a" * 4
      expect(@image).not_to be_valid

      @image.caption = "a" * 51
      expect(@image).not_to be_valid

      @image.caption = "a" * 50
      expect(@image).to be_valid
    end
  end
end

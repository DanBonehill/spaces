require 'rails_helper'

feature "A Host uploads images to their location" do
  let(:location) {FactoryGirl.create(:location_with_address)}

  before do
    visit add_images_location_path(location)
  end

  scenario "the upload is successful" do
    expect(page).to have_content("Upload Images")

    image_pic_path = 'spec/fixtures/files/office.jpg'

    attach_file "location[images_attributes][0][image_pic]", image_pic_path
    click_button "Add Image"

    expect(page).to have_content("Images Uploaded")
    expect(location.images.count).to eq 1
  end
end

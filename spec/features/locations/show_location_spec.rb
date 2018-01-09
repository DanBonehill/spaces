require 'rails_helper'

# Test that line_2 of address appears when present. Does not appear if not.

feature "A Member views a Location" do
  let(:location) {FactoryGirl.create(:location_with_images_and_address)}

  scenario "that exists, has an address and images" do
    visit location_path(location)

    expect(page).to have_selector("h3", text: location.name)
    expect(page).to have_content(location.point_of_contact)
    expect(page).to have_content(location.contact_number)
    expect(page).to have_content(location.max_occupancy)
    expect(page).to have_content(location.size)
    expect(page).to have_content("£#{location.price}")
    expect(page).to have_content(location.description)

    expect(page).to have_css("img[src*='image_pic']")

    expect(page).to have_selector("li", text: location.features.first)
    expect(page).to have_selector("li", text: location.features.last)

    expect(page).to have_content(location.address.line_1)
    expect(page).to have_content(location.address.line_2)
    expect(page).to have_content(location.address.city)
    expect(page).to have_content(location.address.postcode)

    expect(page).to have_css("div#map")

  end

  scenario "that does not exist" do
    visit "/locations/200"

    # Need to handle 404 errors
  end
end

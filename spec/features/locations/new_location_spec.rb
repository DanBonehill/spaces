require 'rails_helper'

feature "A Host creates a Location" do

  def fill_in_form
    fill_in "location[name]", with: FFaker::Lorem.characters(character_count = rand(5..29))
    fill_in "location[point_of_contact]", with: FFaker::Lorem.characters(character_count = rand(3..19))
    fill_in "location[contact_number]", with: FFaker::PhoneNumber.short_phone_number

    fill_in "location[max_occupancy]", with: rand(1..34)
    fill_in "location[size]", with: rand(10..499)
    fill_in "location[price]", with: rand(10..499)

    fill_in "location[address_attributes][line_1]", with: FFaker::AddressUK.street_address
    fill_in "location[address_attributes][line_2]", with: FFaker::AddressUK.neighborhood
    fill_in "location[address_attributes][city]", with: FFaker::AddressUK.city
    fill_in "location[address_attributes][postcode]", with: FFaker::AddressUK.postcode

    fill_in "location[description]", with: FFaker::Lorem.characters(character_count = rand(10..249))
  end

  before do
    visit root_path
  end

  scenario "with all attributes" do
    expect(page).to have_link("Create Location")
    click_link "Create Location"

    expect(page).to have_selector("h1", text: "Create a Location")
    fill_in_form
    click_button "Create"

    expect(Location.count).to eq 1
    expect(page).to have_content("Location Created")
    location = Location.last
    expect(page).to have_current_path(add_images_location_path(location))
  end

  scenario "with invalid attributes" do
    click_link "Create Location"
    click_button "Create"

    expect(Location.count).to eq 0
    expect(page).to have_selector("p", text: "Location could not be created. See below errors.")
    expect(page).to have_current_path(locations_path)
  end
end

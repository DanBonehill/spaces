require 'rails_helper'

feature "A memeber creates their profile" do
  let(:member) {FactoryGirl.create(:member)}

  before do
    login_as(member, :scope => :member)
    visit new_member_profile_path(member)
  end

  scenario "visits page" do
    expect(page).to have_content("Complete your profile")
    
    fill_in "profile[first_name]", with: "Dan"
    fill_in "profile[last_name]", with: "Bonehill"
    fill_in "profile[contact_number]", with: "07447921846"

    click_button "Save"

    expect(page).to have_content("Your profile was successfully created")
  end
end

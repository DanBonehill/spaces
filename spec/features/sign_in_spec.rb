require 'rails_helper'

feature "A member signs in" do
  let(:member) {FactoryGirl.create(:member)}
  let(:member_with_profile) {FactoryGirl.create(:member_with_profile)}

  before do
    visit root_path
    expect(page).not_to have_link("Logout")
    click_link "Sign in"
  end

  scenario "with valid credentials and has a profile" do
    fill_in "member[email]", with: member_with_profile.email
    fill_in "member[password]", with: member_with_profile.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_content("You dont have a profile, please complete your profile to access the rest of the site.")
  end

  scenario "with valid credentials and does not have a profile" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("You dont have a profile, please complete your profile to access the rest of the site.")
  end

  scenario "with invalid credentials" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: " "

    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
  end
end

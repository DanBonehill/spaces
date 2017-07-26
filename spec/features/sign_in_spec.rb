require 'rails_helper'

feature "A member signs in" do
  let(:member) {FactoryGirl.create(:member)}

  before do
    visit root_path
    click_link "Sign in"
  end

  scenario "with valid credentials" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully.")
  end

  scenario "with invalid credentials" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: " "

    click_button "Log in"

    expect(page).to have_content("Invalid Email or password.")
  end
end

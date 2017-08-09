require 'rails_helper'

feature "A member signs up" do
  let(:member) {FactoryGirl.build(:member)}

  before do
    visit root_path
    click_link "Sign up"
  end

  scenario "with valid credentials" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: member.password
    fill_in "member[password_confirmation]", with: member.password

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Complete your profile")
  end

  scenario "without email credentials" do
    fill_in "member[email]", with: " "
    fill_in "member[password]", with: member.password
    fill_in "member[password_confirmation]", with: member.password

    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "without password credentials" do
    fill_in "member[email]", with: member.email
    fill_in "member[password]", with: " "
    fill_in "member[password_confirmation]", with: " "

    click_button "Sign up"

    expect(page).to have_content("Password can't be blank")
  end
end

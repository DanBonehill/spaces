require 'rails_helper'

feature "visting the homepage" do
  scenario "the visitor see the welcome text" do
    visit root_path
    expect(page).to have_selector("h1", text: "Welcome to Spaces")
  end
  scenario "the visitor goes to sign up" do
    visit root_path
    click_link "Become a member"
    expect(page).to have_selector("h2", text: "Sign up")
  end
end

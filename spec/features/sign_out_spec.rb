require 'rails_helper'

feature "A member logs out" do
  let(:member) {FactoryGirl.create(:member_with_profile)}

  before do
    login_as(member, scope: :member)
    visit root_path
  end

  scenario "session is destroyed" do
    expect(page).not_to have_link("Sign in")
    expect(page).not_to have_link("Sign up")

    click_link "Logout"

    expect(page).to have_content("Signed out successfully.")
  end
end

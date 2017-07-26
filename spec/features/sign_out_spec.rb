require 'rails_helper'

feature "A member logs out" do
  let(:member) {FactoryGirl.create(:member)}

  before do
    visit root_path
  end

  scenario "session is destroyed" do
    click_link "Logout"

    expect(page).to have_content("Signed out successfully.")
  end
end

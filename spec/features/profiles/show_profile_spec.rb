require 'rails_helper'

feature "Viewing a profile" do
  let(:profile) {FactoryGirl.create(:profile_with_picture)}
  let(:member) {FactoryGirl.create(:member)}

  scenario "A memeber views their profile" do
    member = profile.member
    login_as(member, :scope => :member)
    visit root_path

    expect(page).to have_content("View Profile")
    click_link("View Profile")
    expect(page).to have_content(profile.full_name)
    expect(page).to have_content(profile.contact_number)
    expect(page).to have_css("img[src*='profile_pic']")
    expect(page).to have_content(profile.member.email)
  end

  scenario "An member views another members profile" do
    login_as(member, :scope => :member)
    visit root_path

    expect(page).not_to have_content("View Profile")

    visit member_profile_path(profile.member, profile)
    expect(page).to have_content("Oops. You're not allowed to view that page.")
  end

  scenario "A non-member views a members profile" do
    visit root_path

    expect(page).not_to have_content("View Profile")

    visit member_profile_path(profile.member, profile)
    expect(page).to have_content("Oops. You're not allowed to view that page.")
  end
end

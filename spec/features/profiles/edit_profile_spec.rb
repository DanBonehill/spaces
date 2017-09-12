require 'rails_helper'

feature "Editing a profile" do
  let(:profile) {FactoryGirl.create(:profile_with_picture)}
  let(:member) {FactoryGirl.create(:member_with_profile)}

  scenario "A memeber edits their profile" do
    member = profile.member
    login_as(member, :scope => :member)
    visit root_path
    click_link("View Profile")

    expect(page).to have_content("Edit Profile")
    click_link("Edit Profile")

    expect(page).to have_content("Edit your profile")
    expect(page).to have_field("First Name:", :type => "text", :with => profile.first_name)
    expect(page).to have_field("Last Name:", :type => "text", :with => profile.last_name)
    expect(page).to have_field("Contact Number:", :type => "text", :with => profile.contact_number)

    fill_in "profile[first_name]", with: "Dan"
    fill_in "profile[last_name]", with: "Bonehill"
    fill_in "profile[contact_number]", with: "07447921846"

    profile_pic_path = 'spec/fixtures/files/profile_pic.jpg'
    attach_file "profile[profile_pic]", profile_pic_path

    click_button "Save"

    expect(page).to have_content("Your profile was successfully updated")

    profile.reload

    expect(profile.full_name).to eq("Dan Bonehill")
    expect(profile.contact_number).to eq("07447921846")
    expect(profile.profile_pic_file_name).to eq 'profile_pic.jpg'

    expect(page).to have_content("Dan Bonehill")
    expect(page).to have_content("07447921846")
    expect(page).to have_css("img[src*='profile_pic']")
  end

  scenario "A member tries to edit another members profile" do
    login_as(member, :scope => :member)

    visit edit_member_profile_path(profile.member, profile)
    expect(page).to have_content("Oops. You're not allowed to view that page.")
  end

  scenario "A non-member tries to edit a members profile" do
    visit edit_member_profile_path(profile.member, profile)
    expect(page).to have_content("Oops. You're not allowed to view that page.")
  end
end

FactoryGirl.define do
  factory :profile do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    contact_number { FFaker::PhoneNumber.phone_number }
    member_id { FactoryGirl.create(:member).id }
  end
end

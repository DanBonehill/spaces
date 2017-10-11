FactoryGirl.define do
  factory :profile do
    first_name { FFaker::Lorem.characters(character_count = rand(3..19)) }
    last_name { FFaker::Name.last_name }
    contact_number { FFaker::PhoneNumber.phone_number[1...19] }
    member

    factory :profile_with_picture do
      profile_pic { File.new("#{Rails.root}/spec/fixtures/files/profile_pic.jpg") }
    end
  end
end

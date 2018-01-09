FactoryGirl.define do
  factory :location do
    name { FFaker::Lorem.characters(character_count = rand(5..29)) }
    point_of_contact { FFaker::Lorem.characters(character_count = rand(3..19)) }
    contact_number { FFaker::PhoneNumber.short_phone_number }
    max_occupancy { rand(1..34) }
    size { rand(10..499) }
    price { rand(10..499) }
    description { FFaker::Lorem.characters(character_count = rand(10..249)) }

    factory :location_with_address do
      after(:create) {|instance| create(:address, location: instance)}
    end

    factory :location_with_features do
      after(:create) {create(:feature)}
      after(:create) {create(:feature)}
    end

    factory :location_with_one_image do
      after(:create) {|instance| create(:image, location: instance)}
    end

    factory :location_with_image_and_caption do
      after(:create) {|instance| create(:image_with_caption, location: instance)}
    end

    factory :location_with_images_and_address do
      after(:create) {|instance| create(:address_with_lat_long, location: instance)}
      after(:create) {|instance| create(:image, location: instance)}
      after(:create) {|instance| create(:image, location: instance)}
    end
  end
end

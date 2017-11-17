FactoryGirl.define do
  factory :location do
    name { FFaker::Lorem.characters(character_count = rand(5..29)) }
    point_of_contact { FFaker::Lorem.characters(character_count = rand(3..19)) }
    contact_number { FFaker::PhoneNumber.short_phone_number }
    max_occupancy { rand(1..34) }
    size { rand(10..499) }
    price { rand(10..499) }
    features { FactoryHelpers.set_features }
    description { FFaker::Lorem.characters(character_count = rand(10..249)) }

    factory :location_with_address do
      after(:create) {|instance| create(:address, location: instance)}
    end

    factory :location_with_one_image do
      FactoryGirl.create(:image)
    end

    factory :location_with_image_and_caption do
      FactoryGirl.create(:image_with_caption)
    end

    factory :location_with_images_and_address do
      FactoryGirl.create_list(:image, 2)
      address
    end
  end
end

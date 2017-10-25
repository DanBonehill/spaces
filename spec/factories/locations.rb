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
      address
    end
  end
end

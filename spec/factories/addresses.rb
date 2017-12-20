FactoryGirl.define do
  factory :address do
    line_1 { FFaker::AddressUK.street_address }
    line_2 { FFaker::AddressUK.neighborhood }
    city { FFaker::AddressUK.city }
    postcode { FFaker::AddressUK.postcode }
    location

    factory :address_with_lat_long do
      latitude { FFaker::Geolocation.lat  }
      longitude { FFaker::Geolocation.lng }
    end
  end
end

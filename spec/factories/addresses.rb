FactoryGirl.define do
  factory :address do
    line_1 { FFaker::AddressUK.street_address }
    line_2 { FFaker::AddressUK.neighborhood }
    city { FFaker::AddressUK.city }
    postcode { FFaker::AddressUK.postcode }
    location
  end
end

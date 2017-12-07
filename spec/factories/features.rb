FactoryGirl.define do
  factory :feature do
    name { FFaker::Lorem.characters(character_count = rand(5..29)) }
  end
end

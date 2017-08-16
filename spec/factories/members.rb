FactoryGirl.define do
  factory :member do
    email { FFaker::Internet.email }
    password { Devise.friendly_token.first(8) }

    factory :member_with_profile do
      profile
    end
  end
end

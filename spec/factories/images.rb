FactoryGirl.define do
  factory :image do
    location
    image_pic { File.new("#{Rails.root}/spec/fixtures/files/office.jpg") }

    factory :image_with_caption do
      caption { FFaker::Lorem.characters(character_count = rand(5..49)) }
    end
  end
end

FactoryGirl.define do
  factory :category do
    name Faker::Name.name
    image_url "I-am-an-image-url"
  end
end

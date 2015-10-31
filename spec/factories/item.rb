FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Company.catch_phrase
    image_url "I-am-an-image-url"
    price Faker::Commerce.price
    category
  end
end

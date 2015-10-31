FactoryGirl.define do
  factory :order_item do
    image_url "I-am-an-image-url"
    price Faker::Commerce.price
    quantity Faker::Number.number(3)
    order
    item
  end
end

FactoryBot.define do
  factory :product do
    title { "My exciting book" }
    description { "Some random text" }
    image_url { "example.jpg" }
    price { 5.05 }
  end
end
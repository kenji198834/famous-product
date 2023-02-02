FactoryBot.define do
  factory :post do
    title {Faker::Lorem.sentence}
    message {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user 
  
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
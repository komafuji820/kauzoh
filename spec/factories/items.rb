FactoryBot.define do
  factory :item do
    memo {Faker::Lorem.word}
    category_id {Faker::Number.between(from: 1, to: 9)}
    association :group
    
    after(:build) do |item|
    item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end

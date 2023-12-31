FactoryBot.define do
  factory :purchase do
    memo {Faker::Lorem.word}
    category_id {Faker::Number.between(from: 1, to: 9)}
    priority_id {Faker::Number.between(from: 1, to: 4)}
    association :group

    after(:build) do |purchase|
      purchase.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end

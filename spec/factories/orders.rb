FactoryBot.define do
  factory :order do
    memo {Faker::Lorem.word}
    category_id {Faker::Number.between(from: 1, to: 9)}
    priority_id {Faker::Number.between(from: 1, to: 4)}
    association :group
    association :item

  end
end

FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 10)}
    email {Faker::Internet.email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
  end
end

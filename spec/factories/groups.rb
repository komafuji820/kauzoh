FactoryBot.define do
  factory :group do
    name {Faker::Name.initials}
  end
end

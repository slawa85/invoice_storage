FactoryGirl.define do
  factory :client do
    name Faker::Name.name
    company
  end
end

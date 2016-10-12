FactoryGirl.define do
  factory :invoice do
    invoice_number Faker::Number.number(10)
    price_with_vat Faker::Commerce.price
    price Faker::Commerce.price
    vat_rate 21
    issued_at Time.zone.now
    client
    category
    company
  end
end

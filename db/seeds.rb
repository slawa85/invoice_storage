# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'csv'
csv_text = File.read("#{File.dirname(__FILE__)}/sample/invoices.csv")

csv = CSV.parse(csv_text, headers: true)
csv.each do |row|
  client_name, company_number,
  invoice_nb, invoice_price,
  vat_rate, issued_at, category = row.to_s.split(',')

  company = Company.create(number: company_number)
  client = Client.create!(name: client_name, company: company)
  category = Category.create!(name: category)

  vat_amount = (invoice_price.to_f * vat_rate.to_i) / 100
  price_with_vat = (invoice_price.to_f + vat_amount).round(2)

  Invoice.create!(invoice_number: invoice_nb,
                  price_with_vat: price_with_vat, price: invoice_price,
                  vat_rate: vat_rate,
                  issued_at: issued_at,
                  client: client, category: category, company: company)
end

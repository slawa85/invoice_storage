class Company < ActiveRecord::Base
  has_many :clients
  has_many :invoices
end

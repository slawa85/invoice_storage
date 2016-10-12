class InvoiceSerializer < ActiveModel::Serializer
  belongs_to :client
  belongs_to :category
  attributes :id, :invoice_number, :price_with_vat,
             :price, :vat_rate, :issued_at
end

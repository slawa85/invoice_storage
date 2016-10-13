module Summary
  class MonthsSerializer < ActiveModel::Serializer
    attribute :date do
      object.invoice_date
    end
    attributes :price_with_vat, :price
  end
end

module Summary
  class MonthsSerializer < ActiveModel::Serializer
    attribute :date do
      object.issued_at.to_date
    end
    attributes :price_with_vat, :price
  end
end

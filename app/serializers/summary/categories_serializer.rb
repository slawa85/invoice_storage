module Summary
  class CategoriesSerializer < ActiveModel::Serializer
    belongs_to :category

    attribute :date do
      object.invoice_date
    end
    attributes :price_with_vat, :price
  end
end

module Summary
  class CategoriesSerializer < ActiveModel::Serializer
    belongs_to :category

    attribute :date do
      object.issued_at.to_date
    end
    attributes :price_with_vat, :price
  end
end

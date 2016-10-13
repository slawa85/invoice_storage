class Invoice < ActiveRecord::Base
  scope :months_summary, lambda {
    group(:invoice_date)
      .select("to_date(cast(issued_at AS TEXT),'YYYY-MM') AS invoice_date,
               sum(price_with_vat) AS price_with_vat, sum(price) AS price")
      .order('invoice_date ASC')
  }

  scope :categories_summary, lambda {
    group(:category_id, :invoice_date)
      .select("category_id,
              to_date(cast(issued_at AS TEXT),'YYYY-MM') AS invoice_date,
              sum(price_with_vat) AS price_with_vat, sum(price) AS price")
      .order('category_id ASC, invoice_date ASC')
      .includes(:category)
  }

  belongs_to :client
  belongs_to :category
  belongs_to :company
end

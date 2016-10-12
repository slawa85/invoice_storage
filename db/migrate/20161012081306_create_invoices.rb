class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :invoice_number, limit: 8
      t.float :price_with_vat
      t.float :price
      t.integer :vat_rate
      t.datetime :issued_at
      t.references :client
      t.references :category
      t.references :company

      t.timestamps null: false
    end
  end
end

require 'rails_helper'

RSpec.describe Invoice, type: :model do
  let!(:category) { FactoryGirl.create :category }
  let!(:first) do
    FactoryGirl.create(:invoice, issued_at: Time.zone.now,
                                 price_with_vat: 12, price: 10, vat_rate: 12,
                                 category: category)
  end

  let!(:second) do
    FactoryGirl.create(:invoice, issued_at: Time.zone.now + 2.days,
                                 price_with_vat: 12, price: 10, vat_rate: 12)
  end

  let!(:third) do
    FactoryGirl.create(:invoice, issued_at: Time.zone.now + 3.days,
                                 price_with_vat: 12, price: 10, vat_rate: 12,
                                 category: category)
  end

  describe '#months_summary' do
    it 'summarise price_with_vat' do
      expect(Invoice.months_summary.first.price_with_vat).to eql(36.0)
    end

    it 'summarise price' do
      expect(Invoice.months_summary.first.price).to eql(30.0)
    end

    it 'display first day of month' do
      date = Time.zone.now.at_beginning_of_month.to_date
      expect(Invoice.months_summary.first.invoice_date).to eql(date)
    end
  end

  describe '#categories_summary' do
    it 'summarise price_with_vat' do
      expect(Invoice.categories_summary.first.price_with_vat).to eql(24.0)
    end

    it 'summarise price' do
      expect(Invoice.categories_summary.first.price).to eql(20.0)
    end

    it 'display first day of month' do
      date = Time.zone.now.at_beginning_of_month.to_date
      expect(Invoice.categories_summary.first.invoice_date).to eql(date)
    end
  end
end

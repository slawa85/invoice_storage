require 'rails_helper'

RSpec.describe Summary::MonthsSerializer do
  let!(:first_invoice) { FactoryGirl.create(:invoice) }
  subject {  Summary::MonthsSerializer.new(sample) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).
      to contain_exactly(
        :date,
        :price_with_vat,
        :price
      )
  end

  def sample
    @sample ||= Invoice.months_summary.first
  end
end

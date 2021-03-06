require 'rails_helper'

RSpec.describe Summary::CategoriesSerializer do
  let!(:category) { FactoryGirl.create(:category) }
  let!(:first_invoice) { FactoryGirl.create(:invoice, category: category ) }

  subject do
    ActiveModelSerializers::Adapter.create(sample_serializer)
  end

  it 'includes the expected attributes for category relationships' do
    expect(subject_json(subject)["category"].keys).
      to contain_exactly(
        "id", "name"
      )
  end

  it 'includes the expected attributes' do
    expect(subject_json(subject).keys).
      to contain_exactly( 'date', 'price_with_vat', 'price', 'category')
  end

  def subject_json(subject)
    JSON.parse(subject.to_json)
  end

  def sample_resource
    invoice = Invoice.categories_summary.first
    @sample_resource ||= invoice
  end

  def sample_serializer
    @sample_serializer ||=
      Summary::CategoriesSerializer.new(sample_resource)
  end
end

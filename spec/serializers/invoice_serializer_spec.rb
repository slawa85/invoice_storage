require 'rails_helper'

RSpec.describe InvoiceSerializer do
  subject do
    ActiveModelSerializers::Adapter.create(sample_serializer)
  end

  it 'includes the expected attributes for client relationships' do
    expect(subject_json(subject)["client"].keys).
      to contain_exactly(
        "id", "name"
      )
  end

  it 'includes the expected attributes for category relationships' do
    expect(subject_json(subject)["category"].keys).
      to contain_exactly(
        "id", "name"
      )
  end

  it 'includes the expected attributes' do
    expect(subject_json(subject).keys).
      to contain_exactly(
        'id', 'invoice_number', 'price_with_vat', 'price',
        'vat_rate', 'issued_at', 'category', 'client'
      )
  end

  def subject_json(subject)
    JSON.parse(subject.to_json)
  end

  def sample_resource
    @sample_resource ||= FactoryGirl.build(:invoice)
  end

  def sample_serializer
    @sample_serializer ||=
      InvoiceSerializer.new(sample_resource)
  end
end

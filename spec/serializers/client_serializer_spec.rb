require 'rails_helper'

RSpec.describe ClientSerializer do
  subject {  ClientSerializer.new(sample) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).
      to contain_exactly(
        :id,
        :name
      )
  end

  def sample
    @sample ||= FactoryGirl.build(:client)
  end
end

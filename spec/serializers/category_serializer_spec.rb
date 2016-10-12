require 'rails_helper'

RSpec.describe CategorySerializer do
  subject {  CategorySerializer.new(sample) }

  it 'includes the expected attributes' do
    expect(subject.attributes.keys).
      to contain_exactly(
        :id,
        :name
      )
  end

  def sample
    @sample ||= FactoryGirl.build(:category)
  end
end

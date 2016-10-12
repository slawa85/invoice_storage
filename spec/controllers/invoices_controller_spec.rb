require 'rails_helper'

RSpec.describe InvoicesController do
  let!(:first_invoice) { FactoryGirl.create :invoice }
  let!(:second_invoice) { FactoryGirl.create :invoice }

  describe 'GET #index' do
    it 'return invoice list' do
      get :index
      serializer = InvoiceSerializer.new(first_invoice)
      expect(response.body).to include(serializer.to_json)
    end
  end
end

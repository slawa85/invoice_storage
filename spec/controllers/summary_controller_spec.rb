require 'rails_helper'

RSpec.describe SummaryController do
  let!(:first_invoice) { FactoryGirl.create :invoice }
  let!(:second_invoice) { FactoryGirl.create :invoice }

  describe 'GET #index' do
    context 'order by month' do
      it {
        get :index, order: :months
        serializer = Summary::MonthsSerializer.new(first_invoice)
        expect(response.body).to include(serializer.to_json)
      }
    end

    context 'order by category' do
      it {
        get :index, order: :categories
        serializer = Summary::CategoriesSerializer.new(first_invoice)
        expect(response.body).to include(serializer.to_json)
      }
    end
  end
end

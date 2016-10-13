require 'rails_helper'

RSpec.describe SummaryController do
  let!(:first_invoice) { FactoryGirl.create :invoice }
  let!(:second_invoice) { FactoryGirl.create :invoice }

  describe 'GET #index' do
    describe 'summary param' do
      describe 'valid' do
        context 'order by month' do
          it {
            get :index, summary: :months
            invoice = Invoice.months_summary.first
            serializer = Summary::MonthsSerializer.new(invoice)
            expect(response.body).to include(serializer.to_json)
          }
        end

        context 'order by category' do
          it {
            get :index, summary: :categories
            invoice = Invoice.categories_summary.first
            serializer = Summary::CategoriesSerializer.new(invoice)
            expect(response.body).to include(serializer.to_json)
          }
        end
      end

      describe 'invalid' do
        it 'should raise error' do
          error = ActionController::UrlGenerationError
          expect { get :index, summary: :trulala }.to raise_error(error)
        end
      end
    end
  end
end

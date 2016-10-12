require 'rails_helper'

RSpec.describe 'API routes' do
  context 'Invoices endpoint' do
    it 'routes GET /api/v1/invoices to #index' do
      expect(get: '/api/v1/invoices').to route_to(
        action: 'index',
        controller: 'invoices'
      )
    end
  end

  context 'Summary endpoints' do
    it 'routes GET /api/v1/summary/months to #index' do
      expect(get: '/api/v1/summary/months').to route_to(
        action: 'index',
        controller: 'summary',
        order: 'months'
      )
    end

    it 'routes GET /api/v1/summary/categories to #index' do
      expect(get: '/api/v1/summary/categories').to route_to(
        action: 'index',
        controller: 'summary',
        order: 'categories'
      )
    end
  end
end

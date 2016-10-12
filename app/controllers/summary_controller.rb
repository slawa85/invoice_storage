class SummaryController < ApplicationController
  def index
    order_by = { months: :issued_at, categories: :category }
    @invoices = Invoice.all.order("#{order_by.fetch(params[:order], 'issued_at')} ASC")
                .includes(:category)

    serializer = "::Summary::#{params[:order].capitalize}Serializer".constantize
    render json: @invoices, each_serializer: serializer, status: :ok
  end
end

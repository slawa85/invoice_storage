class SummaryController < ApplicationController
  def index
    order_criteria = { months: :issued_at, categories: :category }
    order_by = order_criteria.fetch(params[:order], 'issued_at')
    @invoices = Invoice.all.order("#{order_by} ASC")
                       .includes(:category)

    serializer = "::Summary::#{params[:order].capitalize}Serializer".constantize
    render json: @invoices, each_serializer: serializer, status: :ok
  end
end

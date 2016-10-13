class SummaryController < ApplicationController
  def index
    summary = params[:summary]
    @invoices = Invoice.send("#{summary}_summary")

    serializer = "::Summary::#{summary.capitalize}Serializer".constantize
    render json: @invoices, each_serializer: serializer, status: :ok
  rescue NameError
    render json: { error: 'Unprocessable entity' }, status: 422
  end
end

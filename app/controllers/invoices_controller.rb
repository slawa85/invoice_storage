class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.all.includes(:client, :category)
    render json: @invoices, status: :ok
  end
end

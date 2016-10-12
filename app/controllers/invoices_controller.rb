class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :update, :destroy]

  def index
    @invoices = Invoice.all.includes(:client, :category)
    render json: @invoices, status: :ok
  end
end

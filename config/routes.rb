Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :invoices, only: [:index]
    end
  end
end

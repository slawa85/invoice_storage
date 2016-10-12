Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :invoices, only: [:index]
      get 'summary/:order', to: 'summary#index'
    end
  end
end

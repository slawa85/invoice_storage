Rails.application.routes.draw do
  scope :api do
    scope :v1 do
      resources :invoices, only: [:index]
      get 'summary/:summary', to: 'summary#index',
                              constraints: { summary: /months|categories/ }
    end
  end
end

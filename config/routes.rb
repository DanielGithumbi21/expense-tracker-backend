Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :spendings, only: [:index, :show, :create]
  resources :expenses, only: [:show, :create, :destroy, :update]
  resources :incomes, only: [:show, :create, :destroy, :update]

  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
  get '/users/:id/spendings', to: 'spendings#get_users'
  get '/users/:id/incomes', to: 'incomes#get_incomes'
  get '/users/:id/expenses', to: 'expenses#get_expenses'
end

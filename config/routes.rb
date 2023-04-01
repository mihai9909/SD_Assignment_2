Rails.application.routes.draw do
  devise_for :users
  resources :example, only: [:show]
  resource :teacher, only: [:show, :create, :update, :destroy], :defaults => { :format => :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

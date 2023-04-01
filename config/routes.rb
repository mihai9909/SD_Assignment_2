Rails.application.routes.draw do
  devise_for :users
  resources :teachers, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }

  resources :students, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

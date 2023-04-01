Rails.application.routes.draw do
  devise_for :users, :defaults => { :format => :json }
  resources :teachers, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }
  resources :laboratories, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }

  resources :students, only: [:index, :create, :update, :destroy], :defaults => { :format => :json } do
    member do
      post :register
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

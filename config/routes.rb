Rails.application.routes.draw do
  devise_for :users, :defaults => { :format => :json }
  resources :teachers, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }
  resources :laboratories, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }
  resources :attendances, only: [:create, :update, :destroy]

  resources :students, only: [:index, :create, :update, :destroy], :defaults => { :format => :json } do
    member do
      post :register
    end
  end
  get 'students/laboratories', to: 'students#laboratories'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

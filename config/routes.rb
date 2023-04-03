Rails.application.routes.draw do
  devise_for :users, :defaults => { :format => :json }
  resources :teachers, only: [:index, :create, :update, :destroy], :defaults => { :format => :json }
  resources :laboratories, only: [:index, :create, :update, :destroy], :defaults => { :format => :json } do
    member do
      post :assignments, to: 'assignments#create'
      get :assignments, to: 'assignments#index'
    end
  end
  resources :attendances, only: [:create, :update, :destroy]

  resources :students, only: [:index, :create, :update, :destroy], :defaults => { :format => :json } do
    member do
      post :register
    end
  end

  get 'students/laboratories', to: 'students#laboratories'
  put 'assignments/:id', to: 'assignments#update'
  delete 'assignments/:id', to: 'assignments#destroy'
  post 'assignments/:id/submit', to: 'submissions#create'
  put 'submission/:id', to: 'submissions#update'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

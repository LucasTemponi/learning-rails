Rails.application.routes.draw do
  root 'main#index'

  match 'about', to: 'main#new', via: :get
  match 'hello', to: 'main#hello', via: :get
  match 'signup', to: 'registration#new', via: :get
  post 'signup', to: 'registration#create'
  match 'login', to: 'session#new', via: :get
  post 'login', to: 'session#login'
  delete 'logout', to: 'session#destroy'

  patch 'tasks/:id/complete', to: 'tasks#complete_task', as: :complete

  get 'main/index'

  resources :categories do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end
  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/edit'
  # get 'tasks/show'
  # get 'tasks/delete'

  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/delete'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

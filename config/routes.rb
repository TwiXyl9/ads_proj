Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root             'static_pages#home'
  get 'help'    => 'static_pages#help'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :ads_photos
  resources :ads_stages, only: [:edit, :update]
  resources :users
  resources :account_activations,    only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :ads do
    collection do
      delete 'destroy_multiple'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

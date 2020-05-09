Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  end
  get "home/about" => "home#about"
end

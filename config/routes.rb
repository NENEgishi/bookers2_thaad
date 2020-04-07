Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/create'
  get 'comments/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about'=>'homes#about'
  get 'homes/top', to: 'homes#top'
  # get 'user/sign_out'=> 'sessions#destroy'
  resources :books 
  resources :users
  resource :likes
  resource :comments
  # resources :books do 
  # 	resources :favorites 
  # end
  # resources :books, only: [:create,:destroy]
  # resources :books, except: [:create,:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

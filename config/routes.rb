Rails.application.routes.draw do

  get "search" => "searches#search"
  get 'relationships/followings'
  get 'relationships/followers'
  get 'book_comments/create'
  get 'book_comments/destroy'
   root to: "homes#top"
  get "home/about"=>"homes#about", as: 'about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    devise_for :users

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update]

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  get 'chats/:id' => 'chats#show', as: 'chat'
  post 'chats/:id' => 'chats#create'
  resources :chats, only: [:create, :show]





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  end
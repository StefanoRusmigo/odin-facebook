Rails.application.routes.draw do

  post   'comments/create'
  delete 'comments/destroy'
  patch 'comments/update'

  post 'likes/create'
  delete 'likes/destroy'

  root 'posts#index'

  get 'static_pages/home'

  get 'friendships/create'
  delete 'friendships/destroy'

  post 'friend_requests/create'
  get 'requests', to:'friend_requests#index' 
  delete 'friend_requests/destroy'

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  resources :users, only: [:index,:show]
  get 'friends', to: 'users#friends'

  resources :posts

end

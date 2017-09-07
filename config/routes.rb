Rails.application.routes.draw do

  get 'friendships/create'

  get 'friendships/destroy'

  post 'friend_requests/create'

  get 'requests', to:'friend_requests#index' 

  delete 'friend_requests/destroy'



devise_for :users, controllers: {
        sessions: 'users/sessions'
      }


   	root 'users#index'


  resources :users, only: [:index]

  resources :posts

end

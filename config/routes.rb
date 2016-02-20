Rails.application.routes.draw do

  devise_for :users

  resources :dashboard

  root to: 'home#index'

  get '/votes/new', to: 'votes#new', as: 'votes_new'

  post '/votes/create', to: 'votes#create', as: 'votes_create'

  get '/posts/new', to: 'posts#new', as: 'posts_new'

  post '/posts/create', to: 'posts#create', as: 'posts_create'

  get '/invites/new'

  get '/invites/create'

  get '/groups/index'

  get '/groups/show/:id', to: 'groups#show', as: 'groups_show'

  get '/groups/new', to: 'groups#new', as: 'groups_new'

  post '/groups/create', to: 'groups#create', as: 'create_group'

  get '/gifts/new'

  get '/gifts/create'



end

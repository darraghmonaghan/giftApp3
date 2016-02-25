Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks'}

  resources :dashboard

  root to: 'home#index'

  ############################

  get '/votes/new', to: 'votes#new', as: 'votes_new'

  post '/votes/create', to: 'votes#create', as: 'votes_create'

  ############################  

  get '/posts/new', to: 'posts#new', as: 'posts_new'

  post '/posts/create', to: 'posts#create', as: 'posts_create'

  ############################
  
  get '/groups/:id/invites', to: 'invites#new', as: 'invites_new'

  post '/invites/create', to: 'invites#create', as: 'invites_create'

  ############################

  get '/groups/index'

  get '/groups/:id', to: 'groups#show', as: 'groups_show'

  get '/dashboard/groups/new', to: 'groups#new', as: 'groups_new'

  post '/groups/create', to: 'groups#create', as: 'create_group'

  get '/groups/:id/stripe', to: 'groups#stripe', as: 'group_stripe'

  ############################

  get '/groups/:id/gifts', to: 'gifts#new', as: 'gifts_new'

  post '/gifts/create', to: 'gifts#create', as: 'gifts_create'

  ############################

  get '/groups/:id/payments', to: 'payments#new', as: 'new_payment'

  post 'payments/create', to: 'payments#create'


end

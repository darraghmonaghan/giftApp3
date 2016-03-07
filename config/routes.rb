Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks'}

  resources :dashboard

  root to: 'home#index'

  get '/home', to: 'home#show', as: 'home'

  get '/contact', to: 'home#contact'

  get '/about', to: 'home#about'

  get '/faq', to: 'home#faq'

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

  get '/groups/:id/edit', to: 'groups#edit', as: 'groups_edit'

  patch '/groups/:id', to: 'groups#update', as: 'groups_update'

  get '/dashboard/groups/new', to: 'groups#new', as: 'groups_new'

  post '/groups/create', to: 'groups#create', as: 'create_group'

  delete '/groups/:id', to: 'groups#destroy', as: 'destroy_group'

  get '/groups/:id/stripe', to: 'groups#stripe', as: 'group_stripe'

  ############################

  get '/groups/:id/gifts', to: 'gifts#new', as: 'gifts_new'

  get '/groups/:group_id/gifts/:id', to: 'gifts#show', as: 'gifts_show'

  post '/gifts/create', to: 'gifts#create', as: 'gifts_create'

  ############################

  get '/groups/:id/payments', to: 'payments#new', as: 'new_payment'

  post '/payments/create', to: 'payments#create'


end

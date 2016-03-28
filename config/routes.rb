Rails.application.routes.draw do

  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'users/registrations'}

  resources :dashboard

  root to: 'home#index'

  get '/home', to: 'home#show', as: 'home'

  get '/contact', to: 'home#contact', as: 'contact_us'

  post '/contact', to: 'home#sendMessage', as: 'send_message'

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


  ############################

  get '/groups/:id/gifts', to: 'gifts#new', as: 'gifts_new'

  get '/groups/:group_id/gifts/:id', to: 'gifts#show', as: 'gifts_show'

  post '/gifts/create', to: 'gifts#create', as: 'gifts_create'

  post '/groups/:id/gifts', to: 'gifts#amazonSearch', as: 'gifts_search'

  get '/gifts', to: 'gifts#new'

  # post '/gifts', to: 'gifts#amazonHPresults', as: 'gifts_casual_search'

  # post '/gifts/search', to: 'gifts#amazonSearch', as: 'gifts_search'

  ############################

  get '/groups/:id/payments', to: 'payments#new', as: 'new_payment'

  post '/groups/:id/payments/create', to: 'payments#create', as: 'payments_create'

  #############################

  get '/stripeconnect', to: 'groups#stripe', as: 'stripe_connect'

end

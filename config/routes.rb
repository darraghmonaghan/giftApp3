Rails.application.routes.draw do

  get 'votes/new'

  get 'votes/create'

  get 'posts/new'

  get 'posts/create'

  get 'invites/new'

  get 'invites/create'

  get 'groups/index'

  get 'groups/show'

  get 'groups/new'

  get 'groups/create'

  get 'gifts/new'

  get 'gifts/create'

  devise_for :users

  resources :dashboard

  root to: 'home#index'

end

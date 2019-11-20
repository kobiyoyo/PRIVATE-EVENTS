Rails.application.routes.draw do
  root 'static_pages#home'

  get     '/about',         to: 'static_pages#about'
  get     '/contact',       to: 'static_pages#contact'
  
  get     '/signup',        to: 'users#new'
  post    '/signup',        to: 'users#create'

  get     '/login',         to: 'sessions#new'
  post    '/login',         to: 'sessions#create'
  delete  '/logout',        to: 'sessions#destroy'

  post    '/attend',        to: 'attendances#create'
  get     '/attend',        to: 'attendances#create'
  delete  '/unattend',      to: 'attendances#destroy'

  get     '/invite',        to: 'invitations#new'
  post    '/invite',        to: 'invitations#create'
  get     '/notifications', to: 'invitations#show'
  get     '/invitation',    to: 'invitations#destroy'

  resources :users
  resources :events
end

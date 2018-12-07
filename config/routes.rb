Rails.application.routes.draw do
  get 'booking/new'
  devise_for :users, controllers: {
      }
  root to: 'pages#home'
  get '/admin', to: 'pages#admin', as: 'admin'
  get '/admin/lounge', to: 'lounges#new', as: 'lounge_new'
  post '/admin/lounge', to: 'lounges#create', as: 'lounge_create'
  delete '/admin/lounge/:id', to: 'lounges#destroy', as: 'lounge_destroy'

  get '/admin/lounge/:id', to: 'lounges#edit', as: 'lounge_edit'
  post '/admin/lounge/:id', to: 'lounges#update', as: 'lounge_update'
  
  post '/admin/service', to: 'services#new', as: 'service_create'
  get '/lounge/:id', to: 'lounges#show', as: 'lounge_detail'
  post '/lounge/:id', to: 'bookings#new', as: 'lounge_book'
end
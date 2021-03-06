Rails.application.routes.draw do
  get 'booking/new'
  devise_for :users, controllers: {}
  root to: 'pages#home'
  
  # As an airport customer I would like to view lounge availability for a given date.
  get '/api/v1/lounge', to: 'api#lounge_availability_per_day', as: 'api_lounge_availability'
  # As an airport customer I would like to book a lounge for a particular day.
  post '/api/v1/lounge/book', to: 'api#lounge_book', as: 'api_lounge_book'



  get '/admin', to: 'pages#admin', as: 'admin'
  get '/admin/lounge', to: 'lounges#new', as: 'lounge_new'
  post '/admin/lounge', to: 'lounges#create', as: 'lounge_create'
  delete '/admin/lounge/:id', to: 'lounges#destroy', as: 'lounge_destroy'

  get '/admin/lounge/:id', to: 'lounges#edit', as: 'lounge_edit'
  post '/admin/lounge/:id', to: 'lounges#update', as: 'lounge_update'

  get '/admin/service', to: 'services#new', as: 'service_new'
  post '/admin/service', to: 'services#create', as: 'service_create'
  delete '/admin/service/:id', to: 'services#destroy', as: 'service_destroy'

  get '/admin/service/:id', to: 'services#edit', as: 'service_edit'
  post '/admin/service/:id', to: 'services#update', as: 'service_update'

  get '/lounge/:id', to: 'lounges#show', as: 'lounge_detail'
  post '/lounge/:id', to: 'bookings#new', as: 'lounge_book'
end
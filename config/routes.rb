Rails.application.routes.draw do
  get 'booking/new'
  devise_for :users, controllers: {
      }
  root to: 'pages#home'
  get '/admin', to: 'pages#admin', as: 'admin'
  post '/admin/lounge', to: 'lounges#new', as: 'lounge_create'
  post '/admin/service', to: 'services#new', as: 'service_create'
  get '/lounge/:id', to: 'lounges#show', as: 'lounge_detail'
  post '/lounge/:id', to: 'bookings#new', as: 'lounge_book'
end
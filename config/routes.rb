Rails.application.routes.draw do
  get 'booking/new'
  devise_for :users, controllers: {
      }
  root to: 'pages#home'
  get '/lounge/:id', to: 'lounges#show', as: 'lounge_detail'
  post '/lounge/:id', to: 'bookings#new', as: 'lounge_book'
end


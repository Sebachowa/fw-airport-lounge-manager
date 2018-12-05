Rails.application.routes.draw do
  devise_for :users, controllers: {
      }
  root to: 'pages#home'
end


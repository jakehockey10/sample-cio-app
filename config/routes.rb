Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  }
  get 'messages/:id', to: 'messages#show'
  root to: "home#index"
end

# require 'sidekiq/web'

Rails.application.routes.draw do
  get 'login/index', as: :login
  post 'login/create', as: :create_login
  delete 'login/destroy', as: :logout

  resources :users
  resources :chat_groups
  resources :chat_messages, only: %i[create] do
    collection do
      get 'group/:id', to: 'chat_messages#group', as: :group
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  # mount Sidekiq::Web => '/sidekiq'
  # mount ActionCable.server => '/cable'
  #
end

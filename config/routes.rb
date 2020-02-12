Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end
  
  root to: 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :animals do
    resources :comments, only: :create
    resources :rooms do
      get :transaction
      get :unsuccessful
      resources :messages, only: :create
    end

    collection do
      get 'search'
    end
  end
end

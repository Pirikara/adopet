Rails.application.routes.draw do
  devise_for :users,
  controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  
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

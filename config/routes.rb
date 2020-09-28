Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tests#index'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  delete :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    member do
      post :start
    end
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

end

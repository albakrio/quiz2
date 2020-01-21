Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get('/', {to: 'ideas#index', as: :root})
  
  
  resources :ideas do
    resources :reviews, only: [:create, :destroy]
    resources :likes, shallow: true, only: [:create, :destroy]

    get :liked, on: :collection
  end
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # This defines a `route` rule that says when we receive a GET
  # request with the URL `/`, handle it with the `WelcomeController`
  # with the `index` action inside that controller.
  get('/', { to: 'welcome#index', as: 'root'})

  get '/contacts/new', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'
end

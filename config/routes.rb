Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  # This defines a `route` rule that says when we receive a GET
  # request with the URL `/`, handle it with the `WelcomeController`
  # with the `index` action inside that controller.
  get('/', { to: 'welcome#index', as: 'root'})
  # Question Routes
  # get('/questions/new', to: 'questions#new', as: :new_question)
  # post('/questions', to:'questions#create', as: :questions)

  # get('/questions', to: 'questions#index')
  #   #new_question_path or new_question_url
  # get('/questions/:id', to: 'questions#show', as: :question)
  # #question_path(id) or question_url(id)
  # delete('/questions/:id', to: 'questions#destroy')
  # get('/questions/:id/edit', to: 'questions#edit', as: :edit_question)
  # patch('/questions/:id', to: 'questions#update')
  resources :questions
  get '/contacts/new', to: 'contacts#new'
  post '/contacts', to: 'contacts#create'
end

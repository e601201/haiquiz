Rails.application.routes.draw do
  root 'quizes#index'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'log_out', to: 'sessions#destroy', as: 'log_out'

  resources :sessions, only: %i[create destroy]
  
  get '/faqs', to: 'staticpages#faqs'
  get '/about', to: 'staticpages#about'
  resources :quizes, except: %i[edit update], shallow: true do
    resources :answer, only: %i[index create]
  end
end

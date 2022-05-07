Rails.application.routes.draw do
  root 'quizes#index'
  resources :quizes, shallow: true do
    resources :answer, only: %i[index]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

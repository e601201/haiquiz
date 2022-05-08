Rails.application.routes.draw do
  root 'quizes#index'
  get '/faqs', to: 'staticpages#faqs'
  get '/about', to: 'staticpages#about'
  resources :quizes, except: %i[edit update], shallow: true do
    resources :answer, only: %i[index create]
  end
end

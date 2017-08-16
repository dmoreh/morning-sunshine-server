Rails.application.routes.draw do
  resources :documents
  root 'static_pages#home'
  get  '/upload', to: 'documents#new'
  post '/upload', to: 'documents#create'
end

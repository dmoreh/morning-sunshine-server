Rails.application.routes.draw do
  resources :documents
  root 'static_pages#home'
end

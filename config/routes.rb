Rails.application.routes.draw do
  root 'jobs#index'
  get 'jobs', to: 'jobs#index'
  post 'jobs/search', to: 'jobs#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

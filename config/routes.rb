Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :columns, only: %i[new index update], shallow: true do
    resources :jobs
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "dashboard", to: "dashboard#show"
end

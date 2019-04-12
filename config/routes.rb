Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get "flights", to: "flights#index"
  # get "flights/:id", to: "flights#show"

  # #create
  # get "flights/new", to: "flights#new"
  # post "flights", to: "flights#create"

  # #update
  # get "flights/:id/edit", to: "flights#edit"
  # patch "flights/:id", to: "flights#update"

  # #delete
  # delete "flights/:id", to: "flights#destroy"

end

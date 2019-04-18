Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'flights#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights

end

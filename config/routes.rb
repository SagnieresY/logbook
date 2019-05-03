Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'flights#simpleindex'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights do
    collection do
      post :import
    end
  end

  get '/import', to: 'pages#import', as: :import
  get '/simpleindex', to: 'flights#simpleindex'
end

Rails.application.routes.draw do
  namespace :api do
    	namespace :v1 do
			resources :users
			post '/login', to: 'auth#create'
			post '/wishes', to: 'wishes#create'
			get '/wishes', to: 'wishes#index'
			get '/wishes/:id', to: 'wishes#show'
			post '/wishes/:id', to: 'wishes#destroy'
			post '/searches', to: 'searches#create'
			get '/searches', to: 'searches#index'
			get '/me', to: 'users#me'
    	end
    end
end

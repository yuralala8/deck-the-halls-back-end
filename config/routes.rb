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
			post '/friendships', to: 'friendships#create'
			get '/requests/:id', to: 'friendships#pending_requests'
			post '/accept', to: 'friendships#accept'
			post '/delete', to: 'friendships#destroy'
			get '/friendships/:id', to: 'friendships#completed_requests'
			post '/parties', to: 'parties#create'
			get '/parties', to: 'parties#index'
			post '/parties/:id', to: 'parties#destroy'
			get '/me', to: 'users#me'
			post '/userinfo', to: 'users#info'
    	end
    end
end

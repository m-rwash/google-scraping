Rails.application.routes.draw do

#use_doorkeeper
namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
  	resources :keywords do
		collection {post :import}
    collection {get :search}
	end
  end
end	

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

  root 'keywords#index'	
  # get 'keywords/index'
  # get 'keywords/show'
  # post 'keywords/import'

  resources :keywords do
  	collection {post :import}
  end

end

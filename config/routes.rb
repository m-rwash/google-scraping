Rails.application.routes.draw do

namespace :api, defaults: {format: 'json'} do
  namespace :v1 do
  	resources :keywords do
		collection {post :import}
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

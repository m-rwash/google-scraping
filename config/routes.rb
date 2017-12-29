Rails.application.routes.draw do

  use_doorkeeper
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
    	resources :keywords, only: :index do
        collection do
          post :import
          get :search_keyword
          get :search_adwords_urls
          get :search_all_urls
        end
  	  end
    end
  end	

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '*path', to: 'keywords#index'
  root 'keywords#index'	


  resources :keywords, only: :index do
  	collection {post :import}
  end

end

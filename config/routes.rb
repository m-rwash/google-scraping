Rails.application.routes.draw do

  get 'static_pages/home'
  get 'static_pages/about'

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
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

  get '*path', to: 'keywords#index'
  root 'static_pages#home'


  resources :keywords, only: :index do
  	collection {post :import}
  end

end

Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  resources :keywords, only: [:index, :show] do
    collection {post :import}
  end

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

  get 'static_pages/home'
  #get 'static_pages/about'
end

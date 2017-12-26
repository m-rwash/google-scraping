Rails.application.routes.draw do

  root 'keywords#index'	
  # get 'keywords/index'
  # get 'keywords/show'
  # post 'keywords/import'

  resources :keywords do
  	collection {post :import}
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

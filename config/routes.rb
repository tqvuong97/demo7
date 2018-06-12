Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "user/omniauth_callbacks" }
  resources :articles do
 	  resources :comments do
 	 	  resources :replies
 	  end
 	 # resources :replies
	end
	
  resources :posts do
  	collection do 
   		get 'another_index'
   	end
    resources :steps, only: [:show, :update], controller: "post/steps"
  end


  root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

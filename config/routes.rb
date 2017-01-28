Rails.application.routes.draw do
  #resources :themes
  # devise_for :users
  
  	# resources :users
 #  	constraints subdomain: 'api' do
	  scope module: 'api' do
	  	namespace :api do
		    namespace :v1 do
		      resources :themes
		      resources :users
		      resources :my_memories do
		      	collection do
      				get 'user_memories/:user_id' => 'my_memories#user_memories'
  				end
	      	  end
		      mount_devise_token_auth_for 'User', at: 'auth'
		    end
	    end
	  end
	# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

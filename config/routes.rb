Rails.application.routes.draw do
  # devise_for :users
  
  	# resources :users
 #  	constraints subdomain: 'api' do
	  scope module: 'api' do
	  	namespace :api do
		    namespace :v1 do
		      resources :users
		      mount_devise_token_auth_for 'User', at: 'auth'
		    end
	    end
	  end
	# end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

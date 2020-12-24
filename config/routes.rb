Rails.application.routes.draw do

	# add namespacing for convention
	namespace :api do
		namespace :v1 do
			resources :games do
				resources :players				
			end
		end
	end

end

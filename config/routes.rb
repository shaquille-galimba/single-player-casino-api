Rails.application.routes.draw do

	# add namespacing for convention
	namespace: api do
		namespace: v1 do
			resources :players
			resources :games
		end
	end

end

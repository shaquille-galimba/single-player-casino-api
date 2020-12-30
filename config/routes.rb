Rails.application.routes.draw do

	# add namespacing for convention
	namespace :api do
		namespace :v1 do
			resources :games do
				resources :players do
					collection do
						get :highscores
					end
				end
			end
		end
	end

end

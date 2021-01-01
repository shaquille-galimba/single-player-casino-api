Rails.application.routes.draw do

	# add namespacing for convention
	namespace :api do
		namespace :v1 do
			resources :games, only: [:index, :show] do
				resources :players, only: [:index, :create, :show, :update] do
					collection do
						get :highscores
					end
				end
			end
		end
	end

end

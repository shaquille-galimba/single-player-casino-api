class Api::V1::GamesController < ApplicationController

	def index
		@games = Game.all

		render json: GameSerializer.new(@games)
	end

	def show
		if @game = Game.find_by(id: params[:id])
			render json: GameSerializer.new(@game)
		else
			render json: { error: "No game found"}
		end
	end
end

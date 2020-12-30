class Api::V1::PlayersController < ApplicationController
	before_action :set_player, only: [:show, :update]
	before_action :set_game, only: [:index, :create, :highscores]

	def index
		@players = @game.players

		render json: PlayerSerializer.new(@players)
	end

	def highscores
		@players = @game.players.highscores

		render json: PlayerSerializer.new(@players)
	end

	def create
		# @player = Player.where(player_params).first_or_create
		@player = @game.players.find_or_create_by(name: player_params[:name])
		if @player
			render json: PlayerSerializer.new(@player)
		else
			render json: {error: "Error creating player"}
		end
	end

	def show

		if @player
			render json: PlayerSerializer.new(@player)
		else
			render json: { error: "No player found"}
		end
	end

	def update

		if @player
			@player.update(latest_score: player_params[:latest_score])
			render json: PlayerSerializer.new(@player)
		else
			render json: { error: "No player found"}
		end
	end

	private

	def player_params
		params.require(:player).permit(:name, :latest_score, :game_id)
	end

	def set_player
		@player = Player.find_by(id: params[:id])
	end

	def set_game
		@game = Game.find_by(id: params[:game_id])
		return render json: { error: "No game found"} if !@game
	end
end

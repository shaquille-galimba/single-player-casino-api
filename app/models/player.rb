class Player < ApplicationRecord
  belongs_to :game
	before_update :update_highest_score_and_profit
	before_update :update_game_profit

	scope :highscores, -> { order(highest_score: :desc ).limit(5) }

	private
		def update_highest_score_and_profit
			if self.latest_score > self.highest_score
				self.highest_score = self.latest_score
			end
			self.profit += (self.latest_score)
		end

		# update game profit according to player's latest earning
		def update_game_profit
			self.game.profit -= (self.latest_score)
			self.game.save
		end
end

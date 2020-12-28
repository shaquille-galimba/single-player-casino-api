class Player < ApplicationRecord
  belongs_to :game
	before_update :update_highest_score_and_profit, :if => :latest_score_changed?
	before_update :update_game_profit, :if => :latest_score_changed?

	private
		def update_highest_score_and_profit
			if self.latest_score > self.highest_score
				self.highest_score = self.latest_score
			end
			self.profit += (self.latest_score - 1000)
		end

		# update game profit according to player's latest earning
		def update_game_profit
			self.game.profit -= (self.latest_score - 1000)
			self.game.save
		end
end

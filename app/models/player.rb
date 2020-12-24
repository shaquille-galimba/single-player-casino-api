class Player < ApplicationRecord
  belongs_to :game
	validates :name, uniqueness: true
	before_update :update_scores, :if => :latest_score_changed?

	def update_scores
		self.update_highest_score_and_profit
		self.update_game_profit
	end

	def update_highest_score_and_profit
		if self.latest_score > self.highest_score
			self.highest_score = self.latest_score
		end
		self.profit += self.latest_score
	end

	def update_game_profit
		self.game.profit -= self.latest_score
		self.game.save
	end
	private
end

class Player < ApplicationRecord
  belongs_to :game
	validates :name, uniqueness: true
end

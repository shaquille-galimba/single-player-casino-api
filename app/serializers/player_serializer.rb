class PlayerSerializer
  include JSONAPI::Serializer
  attributes :name, :latest_score, :highest_score, :profit, :game_id
	# belongs_to :game
end

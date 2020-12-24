class GameSerializer
  include JSONAPI::Serializer
  attributes :name, :profit
end

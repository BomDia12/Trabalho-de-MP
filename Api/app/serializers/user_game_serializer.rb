class UserGameSerializer < ActiveModel::Serializer
  attributes :winner, :player
  belongs_to :user, serializer: UserSerializer
  belongs_to :game, serializer: GameSerializer
end

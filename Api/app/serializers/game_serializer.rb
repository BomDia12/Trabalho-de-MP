class GameSerializer < ActiveModel::Serializer
  attributes :id, :point_a, :point_b

  has_many :rounds, serializer: RoundSerializer
end

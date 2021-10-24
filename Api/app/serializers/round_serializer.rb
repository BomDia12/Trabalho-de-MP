class RoundSerializer < ActiveModel::Serializer
  attributes :id, :points_a, :points_b, :multiplier, :multiplier_turn, :turn, :ended

  belongs_to :game, serializer: GameSerializer
  has_many :hands, serializer: HandSerializer
  has_many :tables, serializer: TableSerializer
end

class HandSerializer < ActiveModel::Serializer
  attributes :id, :card_a, :card_b, :card_c, :player

  belongs_to :round, serializer: RoundSerializer
end

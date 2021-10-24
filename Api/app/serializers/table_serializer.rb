class TableSerializer < ActiveModel::Serializer
  attributes :id, :card_a, :card_b, :card_c, :card_d

  belongs_to :round, serializer: RoundSerializer
end

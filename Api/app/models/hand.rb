class Hand < ApplicationRecord
  belongs_to :round
  validates :card_a, :card_b, :card_c, presence: true
end

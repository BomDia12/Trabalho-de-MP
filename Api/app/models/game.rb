class Game < ApplicationRecord
    validates :point_a, :point_b, presence: true
    validates :point_a, numericality: {less_than_or_equal_to: 12, greater_than_or_equal_to: 0}
end

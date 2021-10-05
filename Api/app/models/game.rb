class Game < ApplicationRecord
    validates :point_a, :point_b, presence: true
end

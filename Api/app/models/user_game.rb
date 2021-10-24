class UserGame < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates_inclusion_of :player, in: 0..3
end

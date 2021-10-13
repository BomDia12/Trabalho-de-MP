class UserGame < ApplicationRecord
  belongs_to :user

  validates_inclusion_of :player, in: 0..3
end

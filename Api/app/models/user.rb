class User < ApplicationRecord
  # hook for easy token authentication (H2)
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :email
  validates_uniqueness_of :email
  validates_length_of :name, minimum: 3

  has_many :user_games
end

class AddGameToUserGame < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_games, :game, null: false, foreign_key: true
  end
end

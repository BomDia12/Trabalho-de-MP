class AddPlayerToUserGame < ActiveRecord::Migration[6.0]
  def change
    add_column :user_games, :player, :integer
  end
end

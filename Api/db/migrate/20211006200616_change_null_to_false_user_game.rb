class ChangeNullToFalseUserGame < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_games, :user_id, false
  end
end

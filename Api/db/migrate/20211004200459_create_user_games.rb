class CreateUserGames < ActiveRecord::Migration[6.0]
  # Adding relation table for accessing user stats (H1)
  def change
    create_table :user_games do |t|
      t.boolean :winner
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

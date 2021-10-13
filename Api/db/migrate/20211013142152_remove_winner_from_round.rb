class RemoveWinnerFromRound < ActiveRecord::Migration[6.0]
  def change
    remove_column :rounds, :winner, :string
  end
end

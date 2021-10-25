class AddAwaitingConfirmationToRound < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :awaiting_confirmation, :boolean
  end
end

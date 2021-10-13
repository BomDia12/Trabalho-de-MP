class AddFieldsToRound < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :ended, :boolean
  end
end

class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :point_a
      t.integer :point_b

      t.timestamps
    end
  end
end

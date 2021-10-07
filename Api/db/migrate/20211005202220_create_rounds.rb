# frozen_string_literal: true

class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.references :game, null: false, foreign_key: true
      t.string :winner
      t.integer :points_a
      t.integer :points_b
      t.integer :multiplier
      t.integer :multiplier_turn
      t.integer :turn

      t.timestamps
    end
  end
end

# frozen_string_literal: true

class CreateHands < ActiveRecord::Migration[6.0]
  def change
    create_table :hands do |t|
      t.string :card_a
      t.string :card_b
      t.string :card_c
      t.integer :player
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end

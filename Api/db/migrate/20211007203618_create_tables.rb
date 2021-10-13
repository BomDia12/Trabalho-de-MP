# frozen_string_literal: true

class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :card_a
      t.string :card_b
      t.string :card_c
      t.string :card_d
      t.references :round, null: false, foreign_key: true

      t.timestamps
    end
  end
end

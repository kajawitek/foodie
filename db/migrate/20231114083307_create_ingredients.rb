# frozen_string_literal: true

class CreateIngredients < ActiveRecord::Migration[7.1]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false, index: { unique: true }
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

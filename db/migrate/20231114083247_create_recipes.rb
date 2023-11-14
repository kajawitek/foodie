class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title, null: false, index: { unique: true }
      t.text :instruction, null: false

      t.timestamps
    end
  end
end

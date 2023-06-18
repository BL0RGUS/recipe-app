class CreateRecipeMethods < ActiveRecord::Migration[7.0]
  def change
    create_table :recipe_methods do |t|
      t.integer :step
      t.text :details
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

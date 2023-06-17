class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.text :name
      t.text :cuisine
      t.text :method
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

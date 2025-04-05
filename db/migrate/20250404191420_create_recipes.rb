class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :duration
      t.integer :minutes
      t.integer :hours
      t.text :ingredients
      t.text :steps

      t.timestamps
    end
  end
end

class CreateDogs < ActiveRecord::Migration[7.1]
  def change
    create_table :dogs do |t|
      t.string :dog_name
      t.integer :dog_age
      t.string :dog_gender
      t.string :fav_food
      t.references :breed, null: false, foreign_key: true
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end

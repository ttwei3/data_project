class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners do |t|
      t.string :owner_name
      t.string :owner_address
      t.string :owner_city
      t.string :owner_province
      t.string :owner_postal_code

      t.timestamps
    end
  end
end

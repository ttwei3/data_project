class ChangeOwnerIdToBeOptionalInDogs < ActiveRecord::Migration[7.1]
  def change
    change_column_null :dogs, :owner_id, true
  end
end

class AddReferredByToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :referred_by, :integer
  end
end

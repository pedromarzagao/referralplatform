class AddReferencesToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :purchase, :user
  end
end

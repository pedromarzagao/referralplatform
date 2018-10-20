class AddReferencesToReferral < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :referral, :user
  end
end

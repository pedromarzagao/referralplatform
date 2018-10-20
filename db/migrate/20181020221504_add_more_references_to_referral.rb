class AddMoreReferencesToReferral < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :referral, :affiliate
  end
end

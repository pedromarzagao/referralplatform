class AddReferralTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :referral_token, :string
  end
end

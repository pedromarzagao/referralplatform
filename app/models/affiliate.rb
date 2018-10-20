class Affiliate < ApplicationRecord
  has_many :referrals;
  has_many :referred_users, through: :referrals, source: :user;
  has_many :referred_purchases, through: referred_users, source: :purchases
end

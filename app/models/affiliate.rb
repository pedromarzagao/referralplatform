class Affiliate < ApplicationRecord
  has_many :referrals;
  has_many :users, through: :referrals;
  has_many :purchases, through: :users;
  has_one :token;
end

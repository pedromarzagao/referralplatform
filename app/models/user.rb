class User < ApplicationRecord
  has_many :purchases;
  has_one :referral
end

class User < ApplicationRecord
  has_many :purchases;
  has_one :referral
  validates :email, :username, uniqueness: true, presence: true

  before_save :format_email_username
  require "pry-byebug"

  def format_email_username
    self.email = self.email.delete(' ').downcase
    self.username = self.username.delete(' ').downcase
  end

  def self.find_user_by(value)
    where(["username = :value OR email = :value", {value: value}]).first
  end

  def send_login_link(user)
    generate_login_token
    UserMailer.login_link(user, login_link).deliver_now

  end

  def generate_login_token
    self.login_token = generate_token
    self.token_generated_at = Time.now.utc
    save!
  end

  def login_link
    "http://localhost:3000/auth?token=#{self.login_token}"
  end

  def login_token_expired?
    Time.now.utc > (self.token_generated_at + token_validity)
  end

  def expire_token!
    self.login_token = nil
    save!
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def token_validity
    2.hours
  end
end

class ApplicationController < ActionController::Base
  def sign_in_user(user)
    user.expire_token!
    session[:email] = user.email
  end

  def current_user
    User.find_by(email: session[:email])
  end
end

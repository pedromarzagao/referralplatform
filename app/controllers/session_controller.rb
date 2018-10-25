class SessionController < ApplicationController
  def auth
  token = params[:token].to_s
  user_id = params[:user_id]
  user = User.find_by(id: user_id)
  # binding.pry

    if !user || !user.valid_token?(token, user)
      redirect_to root_path, notice: 'It seems your link is invalid. Try requesting for a new login link'
    elsif user.login_token_expired?
      redirect_to root_path, notice: 'Your login link has been expired. Try requesting for a new login link.'
    else
      sign_in_user(user)
      redirect_to user_path(user_id, token), notice: 'You have been signed in!'
    end
  end

  def new
  end

  def create
    value = params[:value].to_s
    user = User.find_user_by(value)

    if !user
      redirect_to new_session_path, notice: "Uh oh! We couldn't find the username / email. Please try again."
    else
      user.send_login_link
      redirect_to root_path, notice: 'We have sent you the link to login to our app'
    end
  end
end

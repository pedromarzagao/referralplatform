class UsersController < ApplicationController

  def register
    @user = User.new
  end

  def show
    user_id = params[:id].to_i
    @user = User.find_by(id: user_id)
    @referral_link = referral_link
  end

  def create
  @user = User.new(user_params)
  @user.referral_token = generate_referral_token

    if @user.save
      @user.send_login_link(@user)
      redirect_to root_path, notice: 'Welcome! We have sent you the link to login to our app'
    else
      render :register
    end
  end

  def user_params
    params.require(:user).permit(:fullname, :username, :email)
  end

  def referral_link
    "http://localhost:3000/join/r=#{@user.referral_token}"
  end

  private

  def generate_referral_token
    SecureRandom.hex(10)
  end

end

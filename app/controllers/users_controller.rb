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
  @user.login_token = generate_login_token

    if @user.save
      @user.send_login_link(@user)
      redirect_to root_path, notice: 'Welcome! We have sent you the link to login to our app'
    else
      render :register
    end
  end

  def join
    referral = params[:r]
    referred_by = User.find_by(referral_token: referral)
    @user = User.new(user_params)
    @user.referred_by = referred_by

    if @user.save
      flash[:success] = "Thanks! I'll be in touch soon!"
      redirect_to :action => 'new'
    else
      render :action => 'new'
    end
  end

  def join_successfully
  end

  def user_params
    params.require(:user).permit(:fullname, :email)
  end

  def referral_link
    "http://localhost:3000/join?r=#{@user.referral_token}"
  end

  private

  def generate_referral_token
    SecureRandom.hex(10)
  end

end

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
  if params[:r] != nil
    referral = params[:r]
    referred_by = User.find_by(referral_token: referral)
    @user.referred_by = referred_by
  end
  @user.referral_token = generate_referral_token
  @user.login_token = generate_login_token
  @user.token_generated_at = generate_login_token_timestamp
  @user.save!

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
    @user = User.new
    # @user.referred_by = referred_by
    # @user.login_token = generate_login_token
    # @user.token_generated_at = generate_login_token_timestamp
    # @user.save!

    # if @user.save
    #   flash[:success] = "You've confirmed your referral successfully!"
    # else
    #   render :action => 'join'
    # end
  end

  def join_successfully
  end

  def resend_login_link
    email = params[:email][:email]
    user = User.find_by(email: email)
    if user.nil?
      flash[:error] = "Sorry, no such email is registered."
    else
      if user.login_token.nil?
        @user = user
        @user.login_token = generate_login_token
        @user.token_generated_at = generate_login_token_timestamp
        @user.save!
      end
      login_link = "http://localhost:3000/auth/#{user.id}/#{user.login_token}"
      UserMailer.login_link(user, login_link).deliver_now
      flash[:notice] = "Check your inbox! We've just sent you your login link."
    end
    # binding.pry
  end

  def recovery_params
    params.require(:email).permit(:email)
  end

  def user_params
    params.require(:user).permit(:fullname, :email)
  end

  def referral_link
    "http://localhost:3000/join?r=#{@user.referral_token}"
  end

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def generate_referral_token
    referral_token = generate_token
  end

  def generate_login_token
    login_token = generate_token
  end

  def generate_login_token_timestamp
    token_generated_at = Time.now.utc
  end

end

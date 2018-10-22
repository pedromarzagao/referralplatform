class UsersController < ApplicationController

  def register
    @user = User.new
  end


  def create
  @user = User.new(user_params)

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

end

class UserMailer < ApplicationMailer

  def login_link(user, login_link)
    @user = user
    @login_link = login_link

    mail(to: @user.email, subject: 'Your Boords Referral Login')
  end
end

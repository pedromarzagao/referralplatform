class UsersController < ApplicationController

  require 'securerandom'

  def validate
    @email = params[:email]
    if User.where(:email = @email)
      validation = true
    else
      validation = false
    end
  end


  def generateCode

    code = SecureRandom.hex[0, 4].upcase

  end

end

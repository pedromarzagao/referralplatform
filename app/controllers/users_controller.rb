class UsersController < ApplicationController

  require 'securerandom'

  def validate
    @email = params[:email]

  end


  def generateCode

    code = SecureRandom.hex

  end

end

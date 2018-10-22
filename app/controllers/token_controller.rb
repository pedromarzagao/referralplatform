class TokenController < ApplicationController

  def show
    @email = params[:email]
    @token = Token.find[:email == @email]
  end

  def new
  end

  def create
    @email = params[:email]
    @affiliate = Affiliate.find[:email == @email]
    if @affiliate.tokens = nil
      @affiliate.tokens = SecureRandom.hex[0, 4].upcase
      @affiliate.tokens.save
    else
      @affiliate.tokens
    end
  end


end

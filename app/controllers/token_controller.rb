class TokenController < ApplicationController
  def new
    email = params[:email]
    affiliate = Affiliate.find[:email = email]
    if affiliate.tokens = nil
      affiliate.tokens = SecureRandom.hex[0, 4].upcase
    else
      affiliate.tokens
    end
  end
end

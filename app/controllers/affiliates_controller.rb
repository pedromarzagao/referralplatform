class AffiliatesController < ApplicationController
 def show
  @affiliate = Affiliate.find(params[:email])
  code = SecureRandom.hex[0, 4].upcase
 end
end

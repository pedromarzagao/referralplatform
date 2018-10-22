class AffiliatesController < ApplicationController
 def show
  @affiliate = Affiliate.find(params[:email])

 end

 def tokens
  @affiliate = Affiliate.find(params[:email])
  @tokens = @affiliate.tokens
 end
end

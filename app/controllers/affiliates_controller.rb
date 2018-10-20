class AffiliatesController < ApplicationController
 def show
  @affiliate = Affiliate.find(params[:email])
 end
end

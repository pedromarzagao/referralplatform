class ReferralsController < ApplicationController

  def new
    @affiliate = params[:email]
    @referral = Referral.new[:email]
  end

end

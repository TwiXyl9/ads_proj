class AdsStagesController < ApplicationController
  def edit
    @ad = Ad.find(params[:id])
    @ad.update(:stage => params[:stage])
    redirect_back :fallback_location => current_user
  end

  def update

  end
end

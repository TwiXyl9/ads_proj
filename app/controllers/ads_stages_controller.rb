class AdsStagesController < ApplicationController
  def edit
    puts params
    puts "HELLLLLLLLLLLLLLLLLLLLLLLLO"
    @ad = Ad.find(params[:id])
    @ad.update(:stage => params[:stage])
    redirect_to current_user
  end

  def update

  end
end

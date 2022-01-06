class AdsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.new(ad_params)
    @ad.stage = Ad.stages["draft"]
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to root_url
    else
      puts @ad.errors.full_messages
    end
  end

  def destroy
  end

  def index
    @ads = Ad.paginate(page: params[:page])
  end

  def show
    @ad = Ad.find(params[:id])
  end

  private
  def ad_params
    params.require(:ad).permit(:tag,:name,:description,{photos:[]})
  end
end

class AdsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @ad = Ad.new
    @ad.stage = "draft"
  end

  def create
    @ad = current_user.ads.new(ad_params)
    @ad.stage = Ad.stages["draft"]
    if @ad.save
      flash[:success] = "Ad created!"
      redirect_to current_user
    else
      puts @ad.errors.full_messages
      render new
    end
  end

  def destroy
    Ad.find(params[:id]).destroy
    flash[:success] = "Ad deleted"
    redirect_to current_user
  end

  def index
    @ads = Ad.paginate(page: params[:page])
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    if params[:t] == 1
      @ad.stage = "pending"
      if @ad.update(ad_params)
        flash[:success] = "Ad sent for moderation!"
      end
    else
      if @ad.update(ad_params)
        flash[:success] = "Ad updated"
        redirect_to current_user
      else
        render 'edit'
      end
    end

  end

  private
  def ad_params
    params.require(:ad).permit(:tag,:stage,:name,:description,{photos:[]})
  end

end

class AdsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

  skip_before_action :verify_authenticity_token, only: [:destroy_multiple, :reject_multiple, :update_multiple]

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
      render 'new'
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
    if @ad.update(ad_params)
      flash[:success] = "Ad updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy_multiple
    puts params
    Ad.destroy(params[:ad_ids]) if params[:ad_ids]
    redirect_to ads_path
  end

  def update_multiple
     if params[:ad_ids] && params[:stage]
       params[:ad_ids].each do |id|
         @ad = Ad.find(id)
         @ad.update(:stage => params[:stage])
       end
     end
    redirect_to ads_path
  end

  def reject_multiple
    puts "HEEEELLLLOOOO"
    puts params
    respond_to do |format|
      format.html
      format.js
    end
  end
  private
  def ad_params
    params.require(:ad).permit(:tag,:stage,:name,:description,{photos:[]})
  end

end

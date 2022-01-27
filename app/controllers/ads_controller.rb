class AdsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  self.per_form_csrf_tokens = true

  #skip_before_action :verify_authenticity_token
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
    puts "HELLLLLLO"
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
    puts "HELLLLLLO"
    Ad.destroy(params[:ad_ids]) if params[:ad_ids]
    respond_to do |format|
      format.html { redirect_to ads_path }
      format.json { head :no_content }
    end
  end

  private
  def ad_params
    params.require(:ad).permit(:tag,:stage,:name,:description,{photos:[]})
  end

end

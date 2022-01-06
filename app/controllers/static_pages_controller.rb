class StaticPagesController < ApplicationController
  def home
    @ad = current_user.ads.build if logged_in?
  end

  def help
  end

  def about
  end

  def contact
  end
end

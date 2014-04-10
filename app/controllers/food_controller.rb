class FoodController < ApplicationController

  def index
    if session[:geo].blank?
      redirect_to root_path
    else
      @venue = get_a_venue(:food, session[:geo])
    end
  end

end

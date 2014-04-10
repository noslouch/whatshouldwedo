class FoodController < ApplicationController
		
  def index
	@venue = get_a_venue(:food, session[:geo])
  end

end
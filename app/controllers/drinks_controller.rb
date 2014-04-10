class DrinksController < ApplicationController

  def index
	@venue = get_a_venue(:drinks, session[:geo])
  end

end
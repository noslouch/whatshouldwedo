class DrinksController < ApplicationController

  def index
    if session[:geo].blank?
      redirect_to root_path
    else
      @venue = get_a_venue(:drinks, session[:geo])
    end
  end

end

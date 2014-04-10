class DrinksController < ApplicationController
  def index
    if params[:id]
      # get venue by id
      @venue = get_a_venue(:drinks)
    else
      @venue = get_a_venue(:drinks)
    end
  end

  def show
  end
end

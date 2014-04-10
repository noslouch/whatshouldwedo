class FoodController < ApplicationController
  def index
    if params[:id]
      # get venue by id
      @venue = get_a_venue(:food)
    else
      @venue = get_a_venue(:food)
    end

  end

  def show
  end
end

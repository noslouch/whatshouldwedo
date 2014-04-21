class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token, if: :json_request?

  include ApplicationHelper

  def set_geo
    p 'Setting session variable'
    if params[:ll].blank?
      @geo = session[:geo]
    else
      @geo = params[:ll]
    end
    p @geo
  end

  def venue
    if params[:ll].blank? && session[:geo].blank?
      p 'parameters and session are blank'
      redirect_to root_path
    else
      set_geo if session[:geo].blank?

      @destination = request.original_fullpath.split('/')[1]
      @venue = get_a_venue(@destination.to_sym, session[:geo])
      render @destination + '/index'
    end
  end

  protected

  def json_request?
    request.format.json?
  end

end

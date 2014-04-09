class WelcomeController < ApplicationController
  def index
    @time = Time.now
    @author = "Brian Whitton"
  end
end

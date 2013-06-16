class HomeController < ApplicationController
  
  # def initialize
  # end

  def index
    @users = User.all
  end

  # def closet_menu_actions
  #   link to add clothes
  #   link to list clothes
  #   link to remove clothes
  #   link to generate clothes
  #   link to 
  # end
end 

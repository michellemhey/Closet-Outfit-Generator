class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create_visitor
    @visitor ||= { :name => "Mr. Test", :email => "example@gmail.com", :password => "changeme", :password_confirmation => "changeme"}
  end


  def delete_user
    @user ||= User.where(:email => @visitor[:email]).first #
    @user.destroy unless @user.nil?
  end


  def sign_in
    visit '/users/sign_in'
    fill_in 'user_email', :with => @visitor[:email]
    fill_in 'user_password', :with => @visitor[:password]
    click_button 'Sign in'
  end
  
end

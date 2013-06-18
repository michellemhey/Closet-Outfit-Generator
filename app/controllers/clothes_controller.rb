class ClothingController < ApplicationController
  
  def index
    @clothings = Clothing.all
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def new
    @clothing = Clothing.new
    @types = Type.find(:all)
  end

  def create
    
  end

  def edit
   
  end

  def update
    
  end

  def delete
    
  end
end
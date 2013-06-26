class ClothingController < ApplicationController

  def index
    @clothings = Clothing.where(:user_id => current_user.id)
  end

  def show
    @clothing = Clothing.find(params[:id])
  end

  def new
    @types = Type.all
    @temperatures = Temperature.all
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(params[:clothing])
    @clothing.image_path = params[:image_path]
    @clothing.type = Type.find(params[:type_id])
    @clothing.user = current_user
    if @clothing.save
      @clothing.temperatures << params[:temperature_ids].map {|id| Temperature.find(Integer(id))}
      redirect_to @clothing
    else
      @types = Type.all
      render :action => 'new'
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
    @types = Type.all
    @temperatures = Temperature.all
  end

  def update
    @clothing = Clothing.find(params[:id])
    @clothing.image_path = params[:image_path]
    @clothing.update_attributes(params[:clothing])
    if @clothing.save
      redirect_to :action => 'index'
    else
      @types = Type.all
      render :action => 'edit'
    end
  end

  def destroy
    @clothing = Clothing.find(params[:id])
    @clothing.destroy
    if @clothing.destroy 
      redirect_to :action => 'index'
    end
  end

  def upload
    
  end
end
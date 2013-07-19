
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
    @styles = Style.all
    @clothing = Clothing.new
  end

  def create
    @clothing = Clothing.new(params[:clothing])
    @clothing.image_path = params[:image_path]
    @clothing.type = Type.find(params[:type_id])
    @clothing.user = current_user
    if @clothing.save
      #Clothing must be saved before we can link many-to-many
      if !params[:temperature_ids].nil?
        @clothing.temperatures << params[:temperature_ids].map {|id| Temperature.find(Integer(id))} 
      end
      if !params[:style_ids].nil?
        @clothing.styles << params[:style_ids].map {|id| Style.find(Integer(id))}
      end
      redirect_to @clothing
    else
      @types = Type.all
      @temperatures = Temperature.all
      @styles = Style.all
      render :action => 'new'
    end
  end

  def edit
    @clothing = Clothing.find(params[:id])
    @types = Type.all
    @temperatures = Temperature.all
    @styles = Style.all
  end

  def update
    @clothing = Clothing.find(params[:id])
    @clothing.image_path = params[:image_path]
    @clothing.update_attributes(params[:clothing])
    if @clothing.save
      if !params[:temperature_ids].nil?
        @clothing.temperatures << params[:temperature_ids].map {|id| Temperature.find(Integer(id))}
      end
      if !params[:style_ids].nil?
        @clothing.styles << params[:style_ids].map {|id| Style.find(Integer(id))}
      end
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
end
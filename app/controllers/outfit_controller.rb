class OutfitController < ApplicationController

  def new
    @putfit = Outfit.new(params[:outfit])
    @clothings = Clothing.all
  end

  def create
    @outfit = Outfit.new(params[:outfit])
    @outfit = Clothing.find(params[:clothing_id])
    if @outfit.save
      redirect_to :action => 'index'
    else
      @clothings = Clothing.all
      render :action => 'new'
    end
  end

  def generate
  end

  def edit
    @outfit = Outfit.find(params[:id])
    @clothings = Clothing.all
  end

  def update
    @outfit = Outfit.find(params[:id])
    @outfit.update(params)
    if @outfit.save
      redirect_to :action => 'index'
    else
      @clothings = Clothing.all
      render :action => 'edit'
    end
  end

  def show
    @outfit = Outfit.find(params[:id])
  end

  def index
    @outfits = Outfit.all
  end

  def destroy
    @outfit = Outfit.find(params[:id])
    @outfit.destroy
    if @outfit.destroy
      redirect_to :action => 'index'
    end
  end

  def favorite
  end
end

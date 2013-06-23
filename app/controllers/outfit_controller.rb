class OutfitController < ApplicationController

  def new
    @putfit = Outfit.new(params[:outfit])
    @tops = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'top', :user_id => current_user.id)
    @bottoms = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'btm', :user_id => current_user.id)
    @shoes = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'shu', :user_id => current_user.id)
  end

  def create
    @outfit = Outfit.new(params[:outfit])
    @outfit = Clothing.find(params[:clothing_id])
    if @outfit.save
      redirect_to :action => 'index'
    else
      @tops = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'top', :user_id => current_user.id)
      @bottoms = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'btm', :user_id => current_user.id)
      @shoes = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'shu', :user_id => current_user.id)
      render :action => 'new'
    end
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
end

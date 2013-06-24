class OutfitController < ApplicationController

  def new
    @putfit = Outfit.new(params[:outfit])
    @tops = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'top', :user_id => current_user.id).shuffle!
    @bottoms = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'btm', :user_id => current_user.id).shuffle!
    @shoes = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'shu', :user_id => current_user.id).shuffle!
  end

=begin
  def generate
    outfit_type = rand(2)
    if outfit_type == 0
      tops = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'top')

      bottoms = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'btm')

      shoes = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'shu')
      
      @selected = []
      @selected << tops.shuffle.first
      @selected << bottoms.shuffle.first
      @selected << shoes.shuffle.first

    elsif outfit_type == 1
      full_outfits = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'full')

      shoes = Clothing.joins('INNER JOIN types ON clothings.type_id = types.id').joins('INNER JOIN type_classes ON types.type_class_id = type_classes.id' ).where('type_classes.symbol' => 'shu')

      @selected = []
      @selected << @full_outfits.shuffle.first
      @selected << @shoes.shuffle.first
    end
  end
=end
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

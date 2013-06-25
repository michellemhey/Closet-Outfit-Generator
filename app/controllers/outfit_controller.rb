class OutfitController < ApplicationController

  def new
    @putfit = Outfit.new(params[:outfit])
    @tops = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'top', :user_id => current_user.id).shuffle!
    @bottoms = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'btm', :user_id => current_user.id).shuffle!
    @shoes = Clothing.joins(:type => :type_class).where('type_classes.symbol' => 'shu', :user_id => current_user.id).shuffle!
  end

#We might use this in the future -- Dont delete
#Yes, I know this is bad VC policy
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
    failed = false
    
    if Outfit.create(params[:outfit])
      if @outfit.clothing_id << Clothing.find(params[:clothing_id])
        redirect_to @outfit
      else
        failed = true
      end
    else
      failed = true
    end

    if failed
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
      redirect_to :action => 's'
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

  def set_favorite
    @outfit = Outfit.find_or_create(params[:outfit])
    @outfit.is_favorite = true
    @outfit.save
  end

  def unset_favorite
    @outfit = Outfit.find(params[:id])
    @outfit.is_favorite = false
    @outfit.save
  end

  def get_favorite
    @is_favorite = Outfit.find(params[:id]).is_favorite
  end
end

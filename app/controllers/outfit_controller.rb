class OutfitController < ApplicationController

  def new
    @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
    @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
    @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!
  end

  def filter
    @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
    @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
    @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!
    render :action => 'new'
  end

  def create
    failed = false
    @outfit = Outfit.new
    @outfit.is_favorite = params[:is_favorite]
    @outfit.user = current_user
    if (params[:wear_now])
      @outfit.last_worn = Time.now()
    end
    if @outfit.save
      clothings = params[:clothings].map { |id| Clothing.find(Integer(id)) }
      if @outfit.clothings << clothings
        print("Injected.")
        redirect_to @outfit
      else
        failed = true
      end
    else
      failed = true
    end

    if failed
      @tops = Clothing.get_by_type_class('top', current_user.id).shuffle!
      @bottoms = Clothing.get_by_type_class('btm', current_user.id).shuffle!
      @shoes = Clothing.get_by_type_class('shu', current_user.id).shuffle!
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

class Admin::ItemsController < ApplicationController

  def index
    @items = Item.all

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.genre_id
    @item.save
    redirect_to items_path
  end

  def show
  end

  def edit
     
  end

  def update

  end

  private

  def item_params
    params.require(:item).permit(:genre, :name, :image, :introduction, :price, :is_active)
  end


end

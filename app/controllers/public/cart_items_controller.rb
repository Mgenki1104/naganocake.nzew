class Public::CartItemsController < ApplicationController
  def index
    #cart_item_params[:item_id]
    @cart_items = CartItem.all
    # cart_item_params[:item_id]
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #@item.genre_id
    @cart_item.save!

    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end

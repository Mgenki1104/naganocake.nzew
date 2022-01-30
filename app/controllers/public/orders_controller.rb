class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer

  end

  def confirmation
    @cart_items = CartItem.find(params[:id])
    @order = Order.new(order_params)
    if params[:select_address] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    elsif params[:select_address] == '1'
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
      # @selected_address = current_customer.addresses.find(params[:address_id])
      # @order.get_shipping_informations_from(@selected_address)
    elsif params[:select_address] == '2' && @order.postal_code? && @order.address? && @order.name?
      # 処理なし
    else
      flash[:error] = '情報を正しく入力して下さい。'
      render :new
    end
  
  end

  def thanks
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment_method)
  end

  def ensure_cart_items
    @cart_items = current_customer.cart_items.includes(:item)
    redirect_to items_path unless @cart_items.first
  end


end

class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    #@addresses = currrent_customer.addresses
    @customer = current_customer
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    #@item.genre_id
    @address.save
    redirect_to public_addresses_path
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to public_addresses_path
  end

  def destroy
  end

  def address_params
    params.require(:address).permit(:customer_id, :name, :postal_code, :address)
  end
end

class Customer::CustomersController < ApplicationController

  def index
  end

  def show
    @customer = Customer.find(params[:id])
    @tweets = @customer.tweets.page(params[:page]).per(5)
  end

  def followings
    customer = Customer.find(params[:id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.find(params[:id])
    @customers = customer.followers
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :phone_number, :is_deleted, :profile_image_id, :introduction)
  end

end

class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
    @customer = Customer.includes(:tweets).find(params[:id])
    @tweets = @customer.tweets.page(params[:page]).per(5)
    @timelines = Tweet.includes(:customer).where(customer_id: [current_customer.id, *current_customer.following_ids]).order(created_at: :desc).page(params[:page]).per(5)
  end

  def followings
    customer = Customer.includes(:relationships).find(params[:id])
    @customers = customer.followings
  end

  def followers
    customer = Customer.includes(:relationships).find(params[:id])
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

  def correct_customer
    @customer = Customer.find(params[:id])
    unless @customer.id == current_customer.id
      redirect_to customer_path
    end
  end

  def unsubscribe
    @customer = Customer.find_by(email: params[:email])
  end

  def withdraw
    @customer = Customer.find(current_customer.id)
    @customer.update(is_valid: false)
    reset_session
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name, :phone_number, :is_deleted, :profile_image_id, :introduction)
  end

end

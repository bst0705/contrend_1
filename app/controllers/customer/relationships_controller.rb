class Customer::RelationshipsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @customer = Customer.find(params[:customer_id])
    customer = Customer.find(params[:customer_id])
    following = current_customer.relationships.build(follower_id: params[:customer_id])
    following.save
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    customer = Customer.find(params[:customer_id])
    following = current_customer.relationships.find_by(follower_id: params[:customer_id])
    following.destroy
  end

end

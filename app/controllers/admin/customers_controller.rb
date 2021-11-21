class Admin::CustomersController < ApplicationController
  before_action :if_not_admin
  

  def index
    @customers = Customer.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
     @customer = Customer.find(params[:id])
  end
end

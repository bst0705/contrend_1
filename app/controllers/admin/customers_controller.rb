class Admin::CustomersController < ApplicationController
  before_action :if_not_admin


  def index
    @customers = Customer.order(created_at: :desc).page(params[:page]).per(15)
  end

  def show
     @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id)
    else
      render 'edit'
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :is_valid)
  end

end

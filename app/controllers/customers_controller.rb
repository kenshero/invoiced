class CustomersController < ApplicationController
  def index
    # @customers =  current_user.customers.all
    # @customers =  Customer.search((params[:q].present? ? params[:q] : '*')).records
      if params[:q].present? && params[:choice].present?
        @customers = current_user.customers.custom_search(params[:q],params[:choice],current_user.id).results
      else
        @customers = current_user.customers.all
        # binding.pry
      end

  end

  def new
    @customer  =  current_user.customers.build
  end

  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  def show
    
  end

  def edit
    @customer = get_customer
  end

  def update
    @customer = get_customer
      if @customer.update_attributes(customer_params)
        redirect_to customers_path
      else
        render 'edit'
      end
  end

  def destroy
    @customer = get_customer
    @customer.destroy
    redirect_to customers_path  
  end

  private 
    def customer_params
      params.require(:customer).permit(:firstname,:lastname,:address,:phone,:user_id)
    end

    def id_param
      params.require(:id)
    end

    def get_customer
      Customer.find(id_param) 
    end
end

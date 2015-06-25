class InvoicesController < ApplicationController
	def index
		@customer = customer_id
		@invoices = scope_page

	end

	def new
		@customer = customer_id
		@invoice  = @customer.invoices.new
		 3.times { @invoice.line_items.build}
	end

	def create
		# render plain: invoice_params.inspect
		@customer = customer_id
		@invoice  = @customer.invoices.new(invoice_params)
		if @invoice.save
			redirect_to customer_invoices_path
		else
			render 'new'
		end	
	end

	def show
		@customer = customer_id
		@invoice  = get_invoice
		@sumpay   = sum_pay
	end

	def destroy
		@customer = customer_id
		@invoice = get_invoice
		@invoice.destroy
		redirect_to customer_invoices_path
	end

	def edit
		@customer = customer_id
		@invoice  = get_invoice
		@sumpay   = sum_pay
		@payment  = @invoice.payments.build
	end

	def update
		@customer = customer_id
	  	@invoice  = get_invoice
	  
	  if @invoice.update_attributes(invoice_params)
	    redirect_to customer_invoices_path
	  else
	    render 'edit'
	  end
	end

private
  def invoice_params
    params.require(:invoice).permit(:invoice_number,:total,:issue_date,:due_date,
    	line_items_attributes: [:id, :product, :qty, :price, :invoice_id, :_destroy],
    	  payments_attributes: [:id, :date,:description,:payment_method,:price_payment, :invoice_id, :_destroy])
  end

  def id_invoice
  	params.require(:id)	
  end

  def customer_id
  	current_user.customers.where(id: params[:customer_id]).first
  end

  def get_invoice
	@customer.invoices.find(id_invoice)  	
  end

  def sum_pay
	sum = 0
	@invoice.payments.each do |payment|
	sum = sum + payment.price_payment
	end  
		sum 	
  end

  def scope_page
  	if @customer.present?
  		@customer.invoices
  	else
  		redirect_to "/404_Not_found"
  	end
  end  

end

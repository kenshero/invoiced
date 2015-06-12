class InvoicesController < ApplicationController
	def index
		@invoices = Invoice.all.order(:invoice_number)
	end

	def new
		#render plain: Invoice.new.inspect
		@invoice  = Invoice.new
		 3.times { @invoice.line_items.build}
	end

	def create
		# render plain: invoice_params.inspect
		@invoice = Invoice.new(invoice_params)
		if @invoice.save
			redirect_to invoices_path
		else
			render 'new'
		end	
	end

	def show
		@invoice = Invoice.find(params.require(:id))
	end

	def destroy
		@invoice = Invoice.find(params.require(:id))
		@invoice.destroy

		redirect_to invoices_path
	end

	def edit
		@invoice = Invoice.find(params.require(:id))
	end

	def update
	  	@invoice = Invoice.find(params.require(:id))
	 
	  if @invoice.update_attributes(invoice_params)
	    redirect_to invoices_path
	  else
	    render 'edit'
	  end
	end

private
  def invoice_params
    params.require(:invoice).permit(:invoice_number,:total,:issue_date,:due_date,
    	line_items_attributes: [:id, :product, :qty, :price, :invoice_id, :_destroy])
  end  
end

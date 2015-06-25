class Invoice < ActiveRecord::Base
	has_many   :line_items, dependent: :destroy
	has_many   :payments, dependent: :destroy
	belongs_to :customer
	validates  :invoice_number,presence: true,uniqueness: true
	accepts_nested_attributes_for :line_items,:payments, allow_destroy: true,
	# reject_if: lambda {|attributes| attributes['product'].blank? || attributes['qty'].blank? || attributes['price'].blank?  }
	reject_if: :all_blank
	
	after_initialize :plus_invoiceNumber
	after_touch	 :calculate,:summation
	attr_accessor :sum
	def plus_invoiceNumber
		@sum = 0
		unless invoice_number
			if Invoice.count == 0
				self.invoice_number = '001'
			else
				last_invoice = Invoice.order(:invoice_number).last
				self.invoice_number = last_invoice.invoice_number.succ
			end
		end
	end

	def calculate
		items = self.line_items.all
		items.each do |item|
			@sum = @sum + (item.qty.to_i * item.price.to_i)
		end
	end

	def summation
		self.total = @sum
		self.save
	end

end

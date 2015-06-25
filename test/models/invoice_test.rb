require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

	# called before every single test
	setup :initialize_invoice

	# called after every single test
	def teardown
		@invoice = nil
	end

	def test_the_truth
	  assert true
	end 

	test "should not save invoice without title" do
	  invoice = Invoice.new
	  assert invoice.save, "Saved the invoice without a title"
	end

	test "should Calculate Invoice" do
		assert_equal 200,@invoice.total
	end

	test "should calculate all total " do
		sum 	= (@lineitem_one.qty.to_i * @lineitem_one.price.to_i) + (@lineitem_three.qty.to_i * @lineitem_three.price.to_i)
		payment = @payment_one.price_payment + @payment_two.price_payment
		sum 	= sum + (sum * 0.07)
		total 	= sum - payment
		assert_equal total,984
	end

	private 
		def initialize_invoice
			@invoice 	 = invoices(:invoice_one)

			@lineitem_one   = line_items(:lineitem_one)
			@lineitem_three = line_items(:lineitem_three)

			@payment_one = payments(:payment_one)
			@payment_two = payments(:payment_two)
		end
end

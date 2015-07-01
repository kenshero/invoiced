require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase

	# called before every single test
	setup :initialize_invoice

	# called after every single test
	def teardown
		@invoice_one = nil
	end

	test "should not save invoice" do
	  invoice = Invoice.new
	  assert invoice.save, "Saved the invoice"
	end

  test "should plus invoice number" do
    new_invoice = Invoice.new
    assert_equal "003",new_invoice.invoice_number
  end

	test "should summation invoice" do
		assert_equal 200, @invoice_one.total
	end

  test "should calculate invoice" do
    sum = @lineitem_one.qty.to_i * @lineitem_one.price.to_i
    assert_equal @invoice_one.total,sum
  end

	private 
		def initialize_invoice
			@invoice_one 	 = invoices(:invoice_one)
      @invoice_two   = invoices(:invoice_two)

			@lineitem_one   = line_items(:lineitem_one)
		end
end


  # test "should calculate all total " do
  #   sum   = (@lineitem_one.qty.to_i * @lineitem_one.price.to_i) + (@lineitem_three.qty.to_i * @lineitem_three.price.to_i)
  #   payment = @payment_one.price_payment + @payment_two.price_payment
  #   sum   = sum + (sum * 0.07)
  #   total   = sum - payment
  #   assert_equal total,984
  # end
require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

	# called before every single test
	setup :initialize_payment

	def teardown
		@payment_one = nil
		@payment_two = nil
	end

	test "should sum payments" do
		sum = @payment_one.price_payment + @payment_two.price_payment
		assert_equal 300,sum 
	end

	private 
		def initialize_payment
			@payment_one = payments(:payment_one)
			@payment_two = payments(:payment_two)
		end
end

require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase
	include Devise::TestHelpers


	# called before every single test
	setup :initialize_invoice

	# called after every single test
	def teardown
		@invoice = nil
	end

	test "should get index" do
		# binding.pry
		sign_in @user_one
		get :index, customer_id: @customer_one.id
		assert_response :success
		# assert_equal( 200, @invoice.total,"Total not 200")
		# assert_not_nil assigns(:invoices)
	end

	test "should create invoices belong to user" do
		sign_in @user_one

		assert_difference('Invoice.count') do
			post :create, customer_id: @customer_one.id , invoice:{
									invoice_number: 003,
									total: 			200,
									issue_date: 	"2015-06-09",
						  			due_date: 		"2015-06-09"
					  			}
		end
		assert_redirected_to customer_invoices_path
	end

	test "should new invoice belong to user" do
		sign_in @user_one
		get :new, customer_id: @customer_one.id
		assert_response :success
	end

	# test "should show invoices " do
	# 	get :show, id: @invoice.id
	# 	assert_response :success
	# end

	test "should delete invoice belong to user" do
		sign_in @user_one
		delete :destroy, customer_id: @customer_one.id, id: @invoice.id
		assert_redirected_to customer_invoices_path
	end

	test "should Edit invoice belong to user" do
		sign_in @user_one
		get :edit, customer_id: @customer_one.id, id: @invoice.id
		assert_response :success
	end

	test "should update invoice" do
		sign_in @user_one
		patch :update, customer_id: @customer_one.id, id: @invoice.id, invoice:{
													invoice_number: @invoice_two.invoice_number.succ,
													total: 			@invoice_two.total,
													issue_date: 	@invoice_two.issue_date,
										  			due_date: 		@invoice_two.due_date
												}
		assert_redirected_to customer_invoices_path
	end	

	test "should show only invoices belonged to this users" do
		sign_in @user_one
		get :show, customer_id: @customer_one.id, id: @invoice.id
		assert_response :success
		# assert_redirected_to invoices_path(assigns(:invoices))
 		# assert true
# ,  customer_id: @customer_two, id_invoice: @invoice
	end

	private 
		def initialize_invoice
			@invoice 	  = invoices(:invoice_one)
			@invoice_two  = invoices(:invoice_two)

			@customer_one = customers(:customer_one)
			# @customer_two = customers(:customer_two)

			@user_one = users(:user_one)
		end

end

  require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  setup :initialize_customer

  def teardown
  	@customer_one = nil
  end

  test "should go index customer" do
  	sign_in @user_one
  	get :index 
  	assert_response :success
  end

  test "should go search index customer" do
    sign_in @user_one
    get :index , q: "K" , op: 2
    assert_equal( "Ken", @customer_one.firstname,"not found search")
  end

  test "should go search index all customer" do
    sign_in @user_one
    get :index , q: "" , op: 1
    assert_equal( "Ken", @customer_one.firstname,"not found search")
    assert_equal( "jaka", @customer_three.firstname,"not found search")
  end

  test "shoude delete customer" do
  	sign_in @user_one
  	delete :destroy ,id: @customer_one.id
  	assert_redirected_to customers_path
  end

  test "should new customer" do
  	sign_in @user_one
  	get :new
  	assert_response :success
  end

  test "should create customer" do
  	sign_in @user_one
  	post :create ,customer:{
	  						 	firstname: "kenza55",
	  							lastname:  "jaajaja",
					   			address:   "petchar",
						  		phone:      2222222
  						    }
  	assert_redirected_to customers_path
  end

  test "should edit customer" do 
  	sign_in @user_one
  	get :edit , id: @customer_one.id
  	assert_response :success
  end

  test "should update customer" do
  	sign_in @user_one
  	patch :update,id: @customer_one.id, customer:{
	  							firstname: "gggg",
	  							lastname:  "wwww",
							   	address:   "eeeee",
							   	phone:      3333
  	             }
  end

  private 
  	def initialize_customer
  		@user_one = users(:user_one)
  		@customer_one = customers(:customer_one)
      @customer_three = customers(:customer_three)
      @customer_one.__elasticsearch__.index_document
  	end
end

require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
	# called before every single test
	setup :initialize_lineitem

	# called after every single test
	def teardown
		@lineitem = nil
	end

	test "should lineitem" do
		sum = @lineitem.qty.to_i * @lineitem.price.to_i
		assert_equal 200,sum
	end

	private 
		def initialize_lineitem
			@lineitem = line_items(:lineitem_one)
		end
end

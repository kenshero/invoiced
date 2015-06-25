require 'test_helper'

class CustomerTest < ActiveSupport::TestCase


  # test "the truth" do
  #   assert true
  # end


end

# Customer.__elasticsearch__.client.indices.delete index: Customer.index_name rescue nil

# Customer.__elasticsearch__.client.indices.create \
#   index: Customer.index_name,
#   body: { settings: Customer.settings.to_hash, mappings: Customer.mappings.to_hash }

# Customer.import
module Customers
  module Searchable
    extend ActiveSupport::Concern

    included do 
      def self.custom_search(query,choice,user_id)
        __elasticsearch__.search(
          {
            query: {
              multi_match: {
                query: query,
                type: "phrase_prefix",
                fields: field_search(choice)
              }
            },
            filter: {
               term: {
                 user_id: user_id
                }
             }
          }
        )
      end

      def self.field_search(choice)
        case choice
        when "all"
          ['firstname', 'lastname', 'address', 'phone']
        when "firstname"
          ['firstname']
        when "lastname"
          ['lastname']
        when "address"
          ['address']
        when "phone"
          ['phone']
        else
          ['firstname', 'lastname', 'address', 'phone']
        end
      end

      # def as_indexed_json(options={})
      #   as_json(
      #     only: [:firstname]
      #   )
      # end
    # end
     end
  end
end

# # Delete the previous Customers index in Elasticsearch
# Customer.__elasticsearch__.client.indices.delete index: Customer.index_name rescue nil

# # Create the new index with the new mapping
# Customer.__elasticsearch__.client.indices.create \
#   index: Customer.index_name,
#   body: { settings: Customer.settings.to_hash, mappings: Customer.mappings.to_hash }

# Customer.import
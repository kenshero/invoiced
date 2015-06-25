module Customers
  module Searchable
    extend ActiveSupport::Concern

    included do 
      include Elasticsearch::Model
      include Elasticsearch::Model::Callbacks
      index_name "#{Rails.env}_customers"
      
      mapping do
        indexes :id, index: :not_analyzed
        indexes :firstname
        # indexes :short_description
        # indexes :long_description
        # indexes :coordinates, type: 'geo_point'
        # indexes :company_number
        # indexes :main_phone_number, type: 'string',  index: :not_analyzed
        # indexes :market_name,  type: 'string'
        # indexes :opening_hours, type: 'nested' do
        #   indexes :periods, type: 'string'
        #   indexes :open_now, type: 'string'
        #   indexes :weekday_text, type: 'string'
        # end
        # indexes :rating
        # indexes :tags_with_score, type: 'nested' do
        #   indexes :name,  type: 'string'
        #   indexes :score, type: 'float'
        # end
        # indexes :tag_names,    type: 'string'
        # indexes :region_names, type: 'string'
        # indexes :site_ids,     type: 'integer', index: :not_analyzed
        # indexes :region_ids,   type: 'integer', index: :not_analyzed
        # indexes :category_ids, type: 'integer', index: :not_analyzed
        # indexes :tag_ids,      type: 'integer', index: :not_analyzed
      end

      def self.custom_search(query,op,user_id)
        fieldSearch = nil
        if op == "1"
          fieldSearch = ['firstname', 'lastname', 'address', 'phone']
        elsif op == "2"
          fieldSearch = ['firstname']
        elsif op == "3"
          fieldSearch = ['lastname']
        elsif op == "4"
          fieldSearch = ['address']
        elsif op == "5"
          fieldSearch = ['phone']                  
        end
        __elasticsearch__.search(
          {
            query: {
              multi_match: {
                query: query,
                type: "phrase_prefix",
                fields: fieldSearch
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

      # def as_indexed_json(options={})
      #   as_json(
      #     only: [:firstname]
      #   )
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
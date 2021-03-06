module Customers
  module Mapping
    extend ActiveSupport::Concern
      included do 
      # include Elasticsearch::Model
      # include Elasticsearch::Model::Callbacks
      index_name "#{Rails.env}_customers"
      mapping do
          indexes :id, index: :not_analyzed
          indexes :firstname
          indexes :lastname
          indexes :address
          indexes :phone
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
    end
  end
end

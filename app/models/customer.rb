class Customer < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks  
  include Customers::Searchable
  include Customers::Mapping
  
  belongs_to :user
  has_many :invoices, dependent: :destroy
  
end
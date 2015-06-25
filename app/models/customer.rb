class Customer < ActiveRecord::Base
  include Customers::Searchable

  belongs_to :user
  has_many :invoices, dependent: :destroy
end
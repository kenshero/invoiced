class Payment < ActiveRecord::Base
  belongs_to :invoice, touch: true
  # validates :payment_method,presence: true
  # validates :price, numericality: { only_integer: true }  
end

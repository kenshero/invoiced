class LineItem < ActiveRecord::Base
  belongs_to :invoice, touch: true
  validates :qty, numericality: { only_integer: true }
  validates :price, numericality: { only_integer: true }
end

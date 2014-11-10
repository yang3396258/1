class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart
  
 attr_accessible :cart_id, :book_id
 attr_accessible :book
end

class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  belongs_to :member
  
  attr_accessor :member_id
  attr_accessible :member_id
end

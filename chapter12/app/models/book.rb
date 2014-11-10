class Book < ActiveRecord::Base
  
  
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :number, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: true
  validates :name, presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }
  validates :full_name, length: { maximum: 20 }
  validates :publisher_name, length: { maximum: 20 }
  validates :price, presence: true,
    numericality: { only_integer: true,
       greater_than: 0, less_than: 10000, allow_blank: true }
  validate :place,presence: true,
    length: { minimum: 2, maximum: 20, allow_blank: true }
  validates :kari_name, length: { maximum: 20 }
  validate :kari_email
  validate :kari_place
  
  
  ACCESSIBLE_ATTRS = [ :number, :name , :full_name, :publisher_name, :book_id, 
    :price , :place, :kari_name, :kari_email, :kari_place, :password, :password_confirmation, :image_attributes ]
  attr_accessible *ACCESSIBLE_ATTRS
  attr_accessible *(ACCESSIBLE_ATTRS + [:number, :administrator]),
    as: :admin
  
    def ensure_not_referenced_by_any_line_item
    if line_items.empty?
    return true
    else
    errors.add(:base, 'Line Items present')
    return false
    end
    end
  
  
  class << self
    def search(query)
      rel = order("number")
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
                "%#{query}%", "%#{query}%")
      end
      rel
    end
  end
end

class Category < ActiveRecord::Base

  # Associations 
  has_many :ads

  #scopes
  scope :order_by_description, -> { order(:description) }

  attr_accessible :description, :ads_count
  validates_presence_of :description
end

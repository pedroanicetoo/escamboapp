class Category < ActiveRecord::Base

  #scopes
  scope :order_by_description, -> { order(:description) }

  attr_accessible :description
  validates_presence_of :description
end

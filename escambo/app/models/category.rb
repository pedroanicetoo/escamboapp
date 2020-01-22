class Category < ActiveRecord::Base
	# Gem Friendly Id
	include FriendlyId
	friendly_id :description, use: :slugged

  # Associations 
  has_many :ads

  #scopes
  scope :order_by_description, -> { order(:description) }

  attr_accessible :description, :ads_count, :slug
  validates_presence_of :description

end

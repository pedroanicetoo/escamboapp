class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :members
  attr_accessible :destription, :title, :members_attributes, :members_id
end

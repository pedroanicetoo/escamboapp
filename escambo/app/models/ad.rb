class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member
  attr_accessible :description,
                  :title,
                  :member,
                  :category
end

class Comment < ActiveRecord::Base
  belongs_to :member
  belongs_to :ad
  attr_accessible :body, :member_id, :ad_id
end

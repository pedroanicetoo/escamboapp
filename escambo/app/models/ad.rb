class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  #validates
  validates :title, :description, :category, presence:true
  validates :picture, :finish_date, presence:true
  validates :price, numericality: { greater_than: 0 }

  #scopes
  scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :to_the, -> (member_id) { where(member_id: member_id) }

  #paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # gem money-rails
  monetize :price_cents

  attr_accessible :description,
                  :title,
                  :member,
                  :member_id,
                  :category,
                  :category_id,
                  :category_description,
                  :price,
                  :picture,
                  :finish_date
end

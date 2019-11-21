class Ad < ActiveRecord::Base
  belongs_to :category
  belongs_to :member

  #scopes
  scope :last_six, -> { limit(6).order(created_at: :desc) }

  #paperclip
  has_attached_file :picture, styles: { large: "800x300#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # gem money-rails
  monetize :price_cents

  attr_accessible :description,
                  :title,
                  :member,
                  :category,
                  :price,
                  :picture
end

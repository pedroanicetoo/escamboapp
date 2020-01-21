class Ad < ActiveRecord::Base

  # Callbacks
  before_save :md_to_html

  #Assossiations 
  belongs_to :member
  belongs_to :category, counter_cache: true 

  #validates
  validates :title, :description_md, :description_short, :category, presence:true
  validates :picture, :finish_date, presence:true
  validates :price, numericality: { greater_than: 0 }

  #scopes
  scope :descending_order, -> (quantity = 10) { limit(quantity).order(created_at: :desc) }
  scope :to_the, -> (member_id) { where(member_id: member_id) }

  #paperclip
  has_attached_file :picture, styles: { large: "900x400#", medium: "320x150#", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
  # gem money-rails
  monetize :price_cents

  attr_accessible :description,
                  :description_md,
                  :description_short,
                  :title,
                  :member,
                  :member_id,
                  :category,
                  :category_id,
                  :category_description,
                  :price,
                  :picture,
                  :finish_date


  private
    def md_to_html
      options = {
          filter_html: true,
          link_attributes: {
            rel: "nofollow",
            target: "_blank"
          }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)
      
      self.description = markdown.render(self.description_md)
    end

end

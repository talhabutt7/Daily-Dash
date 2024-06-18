class BlogPost < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy

  has_rich_text :content
  has_one_attached :image

  validates :title, :content, presence: true

  scope :sorted, -> { order(published_at: :desc, updated_at: :desc) }
  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.zone.now) }
  scope :scheduled, -> { where("published_at > ?", Time.zone.now) }

  def draft?
    published_at.nil?
  end
  def published?
    published_at? && published_at <= Time.zone.now
  end

  def scheduled?
    published_at? && published_at >= Time.zone.now
  end
end

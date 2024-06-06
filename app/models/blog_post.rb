class BlogPost < ApplicationRecord
  validates :title, :body, presence: true

  scope :draft, -> { where(published_at: nil) }
  scope :published, -> { where("published_at <= ?", Time.zone.now).order("published_at DESC") }
  scope :scheduled, -> { where("published_at > ?", Time.zone.now).order("published_at DESC") }

  def draft?
    published_at.nil?
  end

  def published?
    published_at? && published_at <= Time.zone.now
  end
end

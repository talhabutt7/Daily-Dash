require 'rails_helper'

RSpec.describe BlogPost, type: :model do
  # Set up fixtures
  fixtures :blog_posts

  let(:draft_post) { blog_posts(:draft) }
  let(:scheduled_post) { blog_posts(:scheduled) }
  let(:published_post) { blog_posts(:published) }

  before do
    # Set up content for ActionText
    draft_post.content = "Draft Content"
    scheduled_post.content = "Scheduled Content"
    published_post.content = "Published Content"
  end

  describe "#draft?" do
    it "returns true for draft blog post" do
      expect(draft_post.draft?).to be true
    end

    it "returns false for published blog post" do
      expect(published_post.draft?).to be false
    end

    it "returns false for scheduled blog post" do
      expect(scheduled_post.draft?).to be false
    end
  end

  describe "#published?" do
    it "returns true for published blog post" do
      expect(new_published_post.published?).to be true
    end

    it "returns false for draft blog post" do
      expect(new_draft_post.published?).to be false
    end

    it "returns false for scheduled blog post" do
      expect(new_scheduled_post.published?).to be false
    end
  end

  describe "#scheduled?" do
    it "returns true for scheduled blog post" do
      expect(new_scheduled_post.scheduled?).to be true
    end

    it "returns false for published blog post" do
      expect(new_published_post.scheduled?).to be false
    end

    it "returns false for draft blog post" do
      expect(new_draft_post.scheduled?).to be false
    end
  end

  # Helper methods
  def new_draft_post
    BlogPost.new(published_at: nil)
  end

  def new_scheduled_post
    BlogPost.new(published_at: 1.year.from_now)
  end

  def new_published_post
    BlogPost.new(published_at: 1.year.ago)
  end
end

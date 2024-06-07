require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    assert new_draft_post.draft?
  end

  test "draft? returns false for published blog post" do
    refute new_published_post.draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute new_scheduled_post.draft?
  end

  test "published? returns true for published blog post" do
    assert new_published_post.published?
  end

  test "published? returns false for draft blog post" do
    refute new_draft_post.published?
  end

  test "published? returns false for scheduled blog post" do
    refute new_scheduled_post.published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert new_scheduled_post.scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute new_published_post.scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute new_draft_post.scheduled?
  end

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

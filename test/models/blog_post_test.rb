# test/models/blog_post_test.rb
require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  setup do
    @draft = blog_posts(:draft)
    @scheduled = blog_posts(:scheduled)
    @published = blog_posts(:published)

    @draft.content = "Draft Content"
    @scheduled.content = "Scheduled Content"
    @published.content = "Published Content"
  end

  test "draft? returns true for draft blog post" do
    assert @draft.draft?
  end

  test "draft? returns false for published blog post" do
    refute @published.draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute @scheduled.draft?
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
    post = BlogPost.new(published_at: nil, user: users(:user_one))
    post.content = "New Draft Content"
    post
  end

  def new_scheduled_post
    post = BlogPost.new(published_at: 1.year.from_now, user: users(:user_one))
    post.content = "New Scheduled Content"
    post
  end

  def new_published_post
    post = BlogPost.new(published_at: 1.year.ago, user: users(:user_two))
    post.content = "New Published Content"
    post
  end
end

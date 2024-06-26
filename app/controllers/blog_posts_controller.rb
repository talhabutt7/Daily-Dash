# app/controllers/blog_posts_controller.rb

class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blog_posts = BlogPost.published.sorted
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)

    if params[:save_as_draft]
      @blog_post.published_at = nil
    elsif @blog_post.published_at.blank?
      @blog_post.published_at = Time.zone.now
    end

    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path, notice: 'Blog post was successfully destroyed.'
  end

  def my_blogs
    @blog_posts = current_user.blog_posts
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at, :image)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Blog post not found.'
  end
end

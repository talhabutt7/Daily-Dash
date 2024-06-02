class BlogPostsController < ApplicationController

  def index
    @blog_posts = BlogPost.all
  end
  def show
    @blog_post = BlogPost.find(params[:id])
  end

  def create
    @blog_post = BlogPost.new
    @blog_post.title = params[:blog_post][:title]
    @blog_post.body = params[:blog_post][:body]
    @blog_post.save!
    redirect_to blog_post_path(@blog_post)
  end

  def destroy
    blog_post = BlogPost.find(params[:id])
    blog_post.destroy!
    redirect_to blog_posts_path
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    @blog_post.title = params[:blog_post][:title]
    @blog_post.body = params[:blog_post][:body]
    @blog_post.save!
    redirect_to blog_post_path(@blog_post)
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
  
end

# app/controllers/api/v1/blog_posts_controller.rb
module Api
  module V1
    class BlogPostsController < ApplicationController
      before_action :set_blog_post, only: [:show, :update, :destroy, :like, :unlike]

      # GET /api/v1/blog_posts
      def index
        @blog_posts = BlogPost.all
        render json: @blog_posts
      end

      # GET /api/v1/blog_posts/:id
      def show
        render json: @blog_post
      end

      # POST /api/v1/blog_posts
      def create
        @blog_post = BlogPost.new(blog_post_params)
        if @blog_post.save
          render json: @blog_post, status: :created
        else
          render json: @blog_post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/blog_posts/:id
      def update
        if @blog_post.update(blog_post_params)
          render json: @blog_post
        else
          render json: @blog_post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/blog_posts/:id
      def destroy
        @blog_post.destroy
      end

      # POST /api/v1/blog_posts/:id/like
      def like
        @blog_post.increment!(:likes_count)
        render json: { message: 'Liked successfully' }
      end

      # DELETE /api/v1/blog_posts/:id/unlike
      def unlike
        @blog_post.decrement!(:likes_count)
        render json: { message: 'Unliked successfully' }
      end

      private

      def set_blog_post
        @blog_post = BlogPost.find(params[:id])
      end

      def blog_post_params
        params.require(:blog_post).permit(:title, :content)
      end
    end
  end
end

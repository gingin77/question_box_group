class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    set_post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end
end

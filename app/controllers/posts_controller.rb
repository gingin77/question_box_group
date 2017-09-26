class PostsController < ApplicationController
  def index
    @post = Post.all
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
end

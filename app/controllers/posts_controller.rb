class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :post_owner, only: [:update, :destroy]


  def index
    @posts = Post.all
    render 'index.json'
  end

  def show
    render 'show.json'
  end

  def create
    @post = Post.new(post_params)
    @post.user = @user

    if @post.save
      render json: @post, status: :created, location: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
     @post.destroy
   end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:topic, :body)
    end

    def post_owner
      set_post
      redirect_to posts_path unless @post.user == @user
    end
end

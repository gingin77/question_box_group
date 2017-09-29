class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]
  before_action :answer_owner, only: [:update, :destroy]

  def index
    @answers = Answer.all
  end

  def show
    # render 'show.json'
  end

  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = post.find(params[:post_id])
    @answer = @post.answers.find(params[:id])
    @answer.destroy
    redirect_to post_path(@post)
  end

  private
    def answer_params
      params.require(:answer).permit(:answerer, :body)
    end

  # def create
  #   @answer = Post.find(answer_params)
  #   @answer.user = @user
  #   @answer.post = @post
  #   byebug
  #
  #   if @answer.save
  #     render json: @answer, status: :created, location: @answer
  #   else
  #     render json: @answer.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # def update
  #   if @answer.update(answer_params)
  #     render json: @answer
  #   else
  #     render json: @answer.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # def destroy
  #    @answer.destroy
  #  end
  #
  # private
  #   def set_answer
  #     @answer = answer.find(params[:id])
  #   end
  #
  #   def answer_params
  #     params.require(:answer).permit(:topic, :body)
  #   end
  #
  #   def answer_owner
  #     set_answer
  #     redirect_to posts_path unless @answer.user == @user
  #   end
end

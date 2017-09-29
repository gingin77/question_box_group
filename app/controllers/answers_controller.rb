class AnswersController < ApplicationController
  # before_action :set_answer, only: [:show, :update, :destroy]
  before_action :authenticate, only: [:create, :update, :destroy]

  def index
    @answers = Answer.all
  end

  def show
    render 'show.json'
  end


  def create
    @post = Post.find(params[:post_id])
    @answer = @post.answers.create(answer_params)
    @answer.user = @user
    if @answer.save
      render json: @answer, status: :created, location: @post
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    if @answer.update(answer_params)
      render json: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
     @answer.destroy
   end

  private
    # def set_answer
    #   @answer = answer.find(params[:id])
    # end

    def answer_params
      params.require(:answer).permit(:topic, :body)
    end

    # def my_post
    #   @post = Post.find(params[:post_id])
    # end

    # def answer_owner
    #   set_answer
    #   redirect_to books_path unless @answer.user_id == current_user.id
    # end
end

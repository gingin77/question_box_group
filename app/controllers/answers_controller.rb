class AnswersController < ApplicationController
  before_action :require_login, only: %i[new edit create update destroy]
   before_action :is_owner, only: %i[edit update destroy]

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
    render 'show.json'
  end

  def new
    @answer = Answer.new(answer_params)
  end

  def edit
    @answer = Answer.finds(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.user_id = current_user.id if current_user
    if @answer.save
        render json: @answer, status: :created, location: @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def update
    @answer = Answer.find(params[:id])

    if @answer.update(answer_params)
      redirect_to @answer
    else
      render json: @answer.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to answers_path
  end

  private

  def answer_params
    params.require(:answer).permit(:topic, :body, :user_id, :link)
  end

  def logged_in?
     !current_user.nil?
  end

  def require_login
    redirect_to new_session_path unless logged_in
  end

  def is_owner
    @answer = Answer.find(params[:id])
    redirect_to answers_path unless @answer.user_id == current_user
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

end

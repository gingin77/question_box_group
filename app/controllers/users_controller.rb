class UsersController < ApplicationController
  before_action :authenticate, only: [:update, :destroy]
  before_action :is_me, only: [:update, :destroy]

  def index
    @users = User.all
    render 'index.json'
  end

  def show
    @user = User.find(params[:id])
    render 'show.json'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render status: :created, json: {token: @user.token}
    else
      # render json: {
      #   errors: @user.errors
      # }, status: :bad_request
      render status: :bad_request, json: {
        error: "Invalid request. Please try again. New user must have unique username and email, and a password."
      }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      # render json: @user.errors, status: :unprocessable_entity
      render status: :unprocessable_entity, json: {
        error: "Update request failed."
      }
    end
  end

  def login
    user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if !user
      render status: :unauthorized, json: {
        error: "There is no user with that email and password."
      }
    else
      render json: {token: user.token}
    end
  end

  private

  def is_me
    user = User.find(params[:id])
    render status: :unauthorized, json: {error: "A user must be logged in to change their information."} unless user.id == current_user.id
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end


# def is_owner
#     @book = Book.find(params[:id])
#     redirect_to books_path unless @book.user_id == current_user.id
#   end
# end

class UsersController < ApplicationController

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
      render status: :created
    else
      render json: {
        errors: @user.errors
      }, status: :bad_request
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
    else
      # render json: @user.errors, status: :unprocessable_entity
      render status: :unprocessable_entity, json: {
        error: "Invalid request. Please try again. New user must have unique username and email, and a password."
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

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
end

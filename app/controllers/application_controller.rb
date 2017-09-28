class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods

  private

  def authenticate
    authenticate_token || render_unauthorized
    # THIS IS THE SAME AS:
    # if !authenticate_token
    #   render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @user = User.find_by(token: token)
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: {error: 'Bad credentials'}, status: :unauthorized
  end

  #There are three current_user methods below, in descending order of sophistication. The first is basic, the second is more complex but better, avoiding unnecessary database calls.

  # def current_user --> This is what works in Clinton's example
  #   @user
  # end

  # def current_user
  #   User.find(session[:user_id]) if session[:user_id]
  # end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

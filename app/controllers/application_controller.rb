class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception  #=> NOTE: This does not work in an API controller.
  #TODO: See if there is some other thing that must be done instead to protect from forgery, or if this is even necessary.

  private #=> NOTE: Does this line belong in an API controller??


  #NOTE: There are two current_user methods below. The first is basic, the second is more complex but better, avoiding unnecessary database calls.

  # def current_user #=> NOTE: Does this line belong in an API controller??
  #   User.find(session[:user_id]) if session[:user_id]
  # end

  def current_user #=> NOTE: Does this line belong in an API controller??
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user #=> NOTE: Does this line belong in an API controller??

end

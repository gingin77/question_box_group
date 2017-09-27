class ApplicationController < ActionController::API
  protect_from_forgery with: :exception  #=> NOTE: Does this line belong in an API controller??

  private #=> NOTE: Does this line belong in an API controller??

  def current_user #=> NOTE: Does this line belong in an API controller??
    User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user #=> NOTE: Does this line belong in an API controller??

end

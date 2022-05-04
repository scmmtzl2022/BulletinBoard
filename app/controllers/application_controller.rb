class ApplicationController < ActionController::Base
    
  # user
  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
private
def require_login
  unless logged_in?
    flash[:error] = "You must be logged in to access this section"
    redirect_to root_path
  end
end

private
def logged_in?
  !current_user.nil?
end

end

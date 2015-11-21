class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 protect_from_forgery with: :exception

  def check_user
    redirect_to new_user_session_path unless user_signed_in?
    @user = current_user
  end
end

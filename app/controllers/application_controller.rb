class ApplicationController < ActionController::Base
  private

  def logged_in
    user_session = session[:user_id].present?
    redirect_to('/login') unless user_session
    user_session
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end

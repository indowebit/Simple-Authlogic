class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private 
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  protected 
  
  def required_user
    redirect_to :login if !current_user
  end 
  
  def required_no_user
    redirect_to :root if current_user
  end
  
end

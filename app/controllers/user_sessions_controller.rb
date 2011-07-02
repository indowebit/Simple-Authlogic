class UserSessionsController < ApplicationController
  layout 'login'
  before_filter :required_no_user, :only => :new
  
  def index
    redirect_to :login
  end
  
  def new
    @user_session = UserSession.new     
  end 
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successfully" 
      redirect_to :root
    else
      render :action => :new  
    end
  end 
  
  def destroy
    @user_session = UserSession.find 
    @user_session.destroy 
    redirect_to :login
  end 
  
end

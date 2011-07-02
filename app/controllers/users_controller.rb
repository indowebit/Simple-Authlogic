class UsersController < ApplicationController

  before_filter :find_user,  :except => [:index, :new, :create]
  
  def index
    @users = User.find :all 
  end 
  
  def show
     
  end 
  
  def new
    @user = User.new  
  end
  
  def edit
    redirect_to(users_url) if not @user   
  end 
  
  def update
    if @user.update_attributes(params[:user]) 
      flash[:notice] = "user successfully updated" 
      redirect_to(users_url)
    else
      render :action => 'edit' 
    end 
  end
  
  def destroy
    if @user
      @user.destroy 
      flash[:notice] = "user deleted" 
      redirect_to(users_url)
    else
       flash[:notice] = "user not found"
       redirect_to(users_url)     
    end 
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "registration successfull"
       redirect_to(users_url)
    else 
      render :action => 'new' 
    end 
  end 
  
  protected 
    def find_user 
      @user = User.find(params[:id])
    end 
  
end

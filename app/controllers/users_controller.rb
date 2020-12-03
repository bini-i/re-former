class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def new
    @user = User.new
  end
  
  def create 
    @user = User.new(user_params)
    # @user = User.new(username: params[:username], email: params[:email], password: params[:password])
    
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end 

  def update 
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end


class UsersController < ApplicationController

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
    if @user.update(user_params)
      redirect_to user_path
    else
      render 'edit'
    end
    # @user.update_attributes(user_params)  
    # @user.save
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end


end


class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
    logger.debug("user new")
    @user = User.new
  end

  def create
    logger.debug "user create"
    flash[:success] = "Welcome to the e-learning!!"
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :birthday, :registered)
  end
end

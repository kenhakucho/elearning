class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @user = User.page params[:page]
  end
  
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
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :birthday, :registered)
  end
  
  def set_params
    @user = User.find(params[:id])
  end
  
  def correct_user
    redirect_to root_path if @user != current_user
  end
end

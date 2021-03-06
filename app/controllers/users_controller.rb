class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if request.path != user_path(@user)
      redirect_to @user, status: :moved_permanently
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to @user
    else
      render 'new'
    end
  end
end

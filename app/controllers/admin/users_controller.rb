

###### do we need completely separate views for admin or can we reuse some view code?


class Admin::UsersController < ApplicationController
  def index
    @admin = User.find(session[:user_id])
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
  end

   def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    @user.save
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(post_params)
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
  end

  def create
  end

  def destroy
    @user = User.find(params[:id])
    flash.now[:alert] = "Successfully Deleted #{@user.full_name}"
    @user.destroy
    redirect_to admin_users_path
  end



  protected

  def post_params
    params.require(:user).permit(:email, :firstname, :lastname, :admin)
  end


end

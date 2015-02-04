

###### do we need completely separate views for admin or can we reuse some view code?


class Admin::UsersController < ApplicationController
  def index
    @admin = User.find(session[:user_id])
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def edit
  end
end

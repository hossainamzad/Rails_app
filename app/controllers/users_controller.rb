  class UsersController < ApplicationController
  def index
  	@users = User.all
    @user = User.new
  end

  def new
  	@user = User.new
    @users = User.all
  end

	def create
		@user = User.new(username: params[:user][:username], 
      fname: params[:user][:fname], 
      lname: params[:user][:lname],
      password: params[:user][:password], 
      email: params[:user][:email])
    @user.save
    redirect_to user_path(@user)
  end	

  def show
  	@user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])

  end

  def delete
  end


  def update
    @user = User.find(params[:id])
    @user.update(username: params[:user][:username], 
      fname: params[:user][:fname], 
      lname: params[:user][:lname],
      password: params[:user][:password], 
      email: params[:user][:email])
    @user.save
    redirect_to user_path(@user)
  end

  
end
	
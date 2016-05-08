  class SessionsController < ApplicationController
	def new
	end
	
  def create       
  		@user = User.where(email: params[:email]).first      
  		if @user && @user.password == params[:password]
  			session[:user_id] = @user.id 
        flash[:notice] = "Logged In"     
  			redirect_to user_path(@user)
  		else
        flash[:notice] = "There was an error logging you in"
  			redirect_to users_path      
  		end 
	end

  def destroy
  	session[:user_id] = nil 
    flash[:notice] = "Logged Out"     
  	redirect_to users_path
	end
end

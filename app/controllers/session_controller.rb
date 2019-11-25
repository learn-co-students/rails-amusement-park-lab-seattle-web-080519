class SessionController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      flash[:success] = "User Logged in."
      redirect_to user_path(@user)
    else
      flash[:error] = "Error in signin."
      render :new
    end
  end

  def destroy
    if current_user
      # session.delete :user_id
      session[:user_id] = nil
      flash[:success] = "Logged out."
      puts session[:user_id]
      redirect_to root_url
    end
  end
  
end
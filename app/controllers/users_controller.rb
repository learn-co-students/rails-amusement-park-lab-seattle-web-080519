class UsersController < ApplicationController

  before_action :require_login, except: [:new, :create]

  # def index
  #   @users = User.all
  # end

  def show
    find_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "User created"
      redirect_to user_path(@user)
    else
      flash[:error] = "Error. Not created"
      puts @user.errors.full_messages
      render :new
    end
  end

  def edit
    find_user
  end

  def update
    find_user
    if @user.update(user_params)
      flash[:success] = "User updated"
      redirect_to user_path(@user.id)
    else
      flash[:error] = "User update failed."
      puts @user.errors.full_messages
      render :new
    end
  end

  def destroy
    find_user
    @user.destroy
    redirect_to root_url
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :height, :tickets, :happiness, :nausea, :admin)
  end

end

class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sportiveworld stats page"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end

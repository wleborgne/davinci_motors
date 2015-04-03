class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:id] = @user.id
      redirect_to root_path,
        notice: "Thank you for signing up #{@user.first_name.titlecase}"
    else
      render :new
    end
  end

  def my_cars
    @user = User.find(current_user.id)
    @my_cars = @user.cars
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name,
      :email, :password, :password_confirmation)
  end
end

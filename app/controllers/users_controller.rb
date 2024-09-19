class UsersController < ApplicationController
  def create
    render json: { message: "User was successfully created" }
  end

  private

  def user_params
    params.require(:user).permit(:email, :Password, :first_name, :last_name)
  end
end

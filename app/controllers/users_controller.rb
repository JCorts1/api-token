class UsersController < ApplicationController
  skip_before_action :authenticate
  def create
    @user = User.create(user_params)
    if @user.save
    render json: @user.as_json
    else
      render jason: { message: "Issue saving user", errors: @user.errors.full_messages }
    end
  end

  def index
    render json: { user: User.all.map(&:as_json) }
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :username)
  end
end

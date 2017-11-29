class UsersController < ApplicationController
  before_action :authenticate_admin

  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    user = User.find(params[:id])

    if user.update(user_params)
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
  end

  private

  def authenticate_admin
    unless self.current_user.admin?
      render json: { error: 'User is not an admin' }, status: :unauthorized
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

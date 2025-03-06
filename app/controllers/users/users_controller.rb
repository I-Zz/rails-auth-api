class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users/me
  def me
    render json: { user: current_user }, status: :ok
  end

  # PATCH /users/update
  def update
    if current_user.update(user_params)
      render json: { message: "User updated successfully", user: current_user }, status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH /users/update_password
  def update_password
    if current_user.update(password_params)
      render json: { message: "Password updated successfully" }, status: :ok
    else
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /users/delete
  def destroy
    if current_user.destroy
      render json: { message: "User deleted successfully" }, status: :ok
    else
      render json: { errors: "Failed to delete user" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

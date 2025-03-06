class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  # GET /users/me
  def me
    render json: { user: current_user }, status: :ok
  end
end

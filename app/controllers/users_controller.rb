# frozen_string_literal: true

# Article class for creating articles
class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.with_role(:user)
    authorize @users
  end

  def destroy
    @user = User.find(params[:id])
    authorize @user
    @user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end
end

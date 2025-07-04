class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    # @recent_files = current_user.files.order(updated_at: :desc).limit(10)
  end

  def show
    # @file = current_user.files.find(params[:id])
  end

  private

  def authenticate_user!
    redirect_to new_user_session_path unless user_signed_in?
  end
end
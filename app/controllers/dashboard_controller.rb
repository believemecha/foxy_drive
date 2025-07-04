class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      @file_uploads = current_user.file_uploads.order(created_at: :desc)
    end
  
    def show
    end
end
  
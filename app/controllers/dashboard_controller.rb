class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
        @file_uploads = current_user.file_uploads.order(created_at: :desc)

        if params[:q].present?
          query = "%#{params[:q].downcase}%"
          @file_uploads = @file_uploads.where("LOWER(title) LIKE ? OR LOWER(description) LIKE ?", query, query)
        end
      
        @file_uploads = @file_uploads.page(params[:page]).per(10) # Show 10 per page
    end
      
  
    def show
    end
end
  
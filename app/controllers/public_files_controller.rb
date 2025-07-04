class PublicFilesController < ApplicationController
    def show
      @file = FileUpload.includes(:user, file_attachment: :blob).find_by!(short_token: params[:short_token])
    end
end
  
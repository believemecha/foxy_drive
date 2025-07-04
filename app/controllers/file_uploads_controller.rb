class FileUploadsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @file_upload = current_user.file_uploads.build(file_upload_params)
      @file_upload.file_type = @file_upload.file.blob.content_type if @file_upload.file.attached?
  
      if @file_upload.save
        redirect_to root_path, notice: "File uploaded successfully."
      else
        redirect_to root_path, alert: @file_upload.errors.full_messages.to_sentence
      end
    end

    def destroy
        file = current_user.file_uploads.find(params[:id])
        file.destroy
        redirect_to root_path, notice: "File deleted successfully."
    end
  
    private
  
    def file_upload_params
      params.require(:file_upload).permit(:title, :description, :file)
    end
end
  
module ApplicationHelper
    def file_type_label(mime_type)
      return "Unknown" unless mime_type
  
      case mime_type
      when /pdf/
        "PDF"
      when /image/
        "Image"
      when /zip|compressed|tar/
        "Archive"
      when /msword|officedocument/
        "Document"
      when /spreadsheet/
        "Spreadsheet"
      when /text/
        "Text File"
      when /audio/
        "Audio"
      when /video/
        "Video"
      else
        mime_type.split("/").last.capitalize
      end
    end
end
  
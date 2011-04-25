
class MedtrContent < ActiveRecord::Base

  belongs_to :user
  
  DATA_FILE_ROOT = ::Rails.root.to_s + "/data/"

  def upload_data_file(file)
    # Check content type and file extension.
    file_ext = File.extname(File.basename(file.original_filename)).downcase
    content_type = file.content_type.downcase
    if file_ext != '.txt' || content_type != 'text/plain'
      raise ArgumentError, "File extension and Content-Type must be .txt and text/plain."
    end
    
    name = self.class.to_s.downcase + '.txt'
    self.file_name = name
    File.open("#{DATA_FILE_ROOT}#{name}", 'w') {|f| f.write(file.read)}
  end

end
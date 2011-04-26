
class PhavuContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  def index
    @phavu = PhavuContent.first
    @data_file = read_data_file(@phavu.file_name)
  end

  def edit
    @phavu = PhavuContent.find(params[:id])
    set_tool_bar
  end
  
  def update
    @phavu = PhavuContent.find(params[:id])
    set_tool_bar
    unless params[:file_upload].blank?
      begin
        @phavu.upload_data_file(params[:file_upload][:file])
      rescue ArgumentError => e
        flash[:error] = e.message
        render :edit, :layout => "single_col"
        return
      end
    end
    @phavu.updated_at = Time.now
    @phavu.user_id = current_user.id
    if @phavu.update_attributes(params[:phavu_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :edit, :layout => "single_col"
    end
  end
  
  def send_data_file
    @phavu = PhavuContent.find(params[:id])
    send_file(PhavuContent::DATA_FILE_ROOT + @phavu.file_name, :type => 'text/plain', :disposition => 'attachment')
  end
  
  private
  def set_tool_bar
    if (has_role? :superuser)
      @tool_bar = "AdminToolbar"
    else
      @tool_bar = "MemberToolbar"
    end
  end
  
  def set_layout
    case action_name
    when "edit"
      "single_col"
    else
      "application"
    end
  end
  
  def read_data_file(file)
    data = []
    return data if file.blank?
    
    file = PhavuContent::DATA_FILE_ROOT + file
    if File.exists?(file) && File.readable?(file)
      data = File.readlines(file)
      data.each {|l| l.chomp!}
    end
    data
  end
  
end

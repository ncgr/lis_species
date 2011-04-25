
class MedtrContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  def index
    @medtr = MedtrContent.first
    @data_file = read_data_file(@medtr.file_name)
  end

  def edit
    @medtr = MedtrContent.find(params[:id])
    set_tool_bar
  end
  
  def update
    @medtr = MedtrContent.find(params[:id])
    set_tool_bar
    unless params[:file_upload].blank?
      begin
        @medtr.upload_data_file(params[:file_upload][:file])
      rescue ArgumentError => e
        flash[:error] = e.message
        render :edit, :layout => "single_col"
        return
      end
    end
    @medtr.updated_at = Time.now
    @medtr.user_id = current_user.id
    if @medtr.update_attributes(params[:medtr_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :edit, :layout => "single_col"
    end
  end
  
  def send_data_file
    @medtr = MedtrContent.find(params[:id])
    send_file(MedtrContent::DATA_FILE_ROOT + @medtr.file_name, :type => 'text/plain', :disposition => 'attachment')
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
    data = nil
    file = MedtrContent::DATA_FILE_ROOT + file
    if File.exists?(file) && File.readable?(file)
      data = File.readlines(file)
      data.each {|l| l.chomp!}
    end
    data
  end
  
end

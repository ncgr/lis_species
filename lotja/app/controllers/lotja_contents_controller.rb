
class LotjaContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  def index
    @lotja = LotjaContent.first
    @data_file = read_data_file(@lotja.file_name)
  end

  def edit
    @lotja = LotjaContent.find(params[:id])
    set_tool_bar
  end
  
  def update
    @lotja = LotjaContent.find(params[:id])
    set_tool_bar
    unless params[:file_upload].blank?
      begin
        @lotja.upload_data_file(params[:file_upload][:file])
      rescue ArgumentError => e
        flash[:error] = e.message
        render :edit, :layout => "single_col"
        return
      end
    end
    @lotja.updated_at = Time.now
    @lotja.user_id = current_user.id
    if @lotja.update_attributes(params[:lotja_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :edit, :layout => "single_col"
    end
  end
  
  def send_data_file
    @lotja = LotjaContent.find(params[:id])
    send_file(LotjaContent::DATA_FILE_ROOT + @lotja.file_name, :type => 'text/plain', :disposition => 'attachment')
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
    
    file = LotjaContent::DATA_FILE_ROOT + file
    if File.exists?(file) && File.readable?(file)
      data = File.readlines(file)
      data.each {|l| l.chomp!}
    end
    data
  end
  
end


class LotjaContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  before_filter :set_tool_bar, :only => [:edit, :update]
  
  def index
    @content = LotjaContent.first
    @name = Legume.where({:id => @content.legume_id}).first.name
    @data_file = read_data_file(@content.file_name)
  end

  def edit
    @content = LotjaContent.find(params[:id])
  end
  
  def update
    params[:lotja_content][:existing_pathogens_attributes] ||= {}
    
    @content = LotjaContent.find(params[:id])
    unless params[:file_upload].blank?
      begin
        @content.upload_data_file(params[:file_upload][:file])
      rescue ArgumentError => e
        flash[:error] = e.message
        render :edit, :layout => "single_col"
        return
      end
    end
    @content.updated_at = Time.now
    @content.user_id = current_user.id
    if @content.update_attributes(params[:lotja_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :edit, :layout => "single_col"
    end
  end
  
  def send_data_file
    @content = LotjaContent.find(params[:id])
    send_file(LotjaContent::DATA_FILE_ROOT + @content.file_name, :type => 'text/plain', :disposition => 'attachment')
  end
  
  private
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

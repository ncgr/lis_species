
class MedtrContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  def index
    @medtr = MedtrContent.first
  end

  def edit
    @medtr = MedtrContent.find(params[:id])
    set_tool_bar
  end
  
  def update
    @medtr = MedtrContent.find(params[:id])
    if @medtr.update_attributes(params[:medtr_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :action => "edit"
    end
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
  
end

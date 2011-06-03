
class LotjaContentsController < ApplicationController

  layout :set_layout
  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  before_filter :set_tool_bar, :only => [:edit, :update]
  
  def index
    @content = LotjaContent.first
    
    # Attributes for tables
    @overview_attr = ["taxon_id", "season", "nodulation_type", "nodulator_species", "nodulator_taxon_id",
      "flowering_type", "pollination_type", "self_incompatibility"]
    @genome_attr = ["chromosomes", "genome_size", "ploidy", "ploidy_type",
      "gc_content_genome", "gc_content_transcriptome", "chloroplast_genome_size",
      "chloroplast_accession_number","mitochondria_genome_size","mitochondria_accession_number"]
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
    @content.user_id    = current_user.id
    if @content.update_attributes(params[:lotja_content]) && 
      @content.lotja_genome_summary.update_attributes(params[:lotja_genome_summary]) &&
      @content.lotja_resource.update_attributes(params[:lotja_resource]) &&
      @content.lotja_selected_reference.update_attributes(params[:lotja_selected_reference])
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
  
end

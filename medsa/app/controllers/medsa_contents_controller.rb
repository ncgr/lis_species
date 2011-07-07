
class MedsaContentsController < ApplicationController

  before_filter :authenticate_user!, :except => :index
  filter_access_to :edit, :update
  
  before_filter :set_tool_bar, :only => [:edit, :update]
  
  def index
    @content = MedsaContent.first
    
    # Attributes for table helper
    @overview_attr = ["ncbi_taxon_id","grin_taxon_id","season",
      "nodulation_type","flowering_type","pollination_type",
      "self_incompatibility"]
    @genome_attr = ["chromosomes","genome_size","ploidy","ploidy_type",
      "gc_content_genome","gc_content_transcriptome","chloroplast_genome_size",
      "chloroplast_accession_number","mitochondria_genome_size",
      "mitochondria_accession_number"]
  end

  def edit
    @content = MedsaContent.find(params[:id])
  end
  
  def update
    params[:medsa_content][:existing_pathogens_attributes] ||= {}
    params[:medsa_content][:existing_nodulators_attributes] ||= {}
    params[:medsa_content][:existing_reference_datasets_attributes] ||= {}
    params[:medsa_content][:existing_resources_attributes] ||= {}
    
    @content = MedsaContent.find(params[:id])
    
    @content.updated_at = Time.now
    @content.user_id    = current_user.id
    
    if @content.update_attributes(params[:medsa_content])
      flash[:error] = "Successfully updated contents."
      redirect_to root_path
    else
      flash[:notice] = "Unable to update contents"
      render :edit
    end
  end
  
end

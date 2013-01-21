require 'spec_helper'

describe "EdituphacnContents" do

  before(:each) do
    create_roles
    @content = FactoryGirl.create(:phacn_content)
    set_host
  end

  # Skip CKEditor instance testing since it requires JavaScript.
  # Ex: CKEditor.isntances['id'].setData('foo')

  it "as superuser" do
    user = create_user("superuser")

    visit phacn_contents_path
    click_link "Sign In"

    click_link "Edit Contents"
    fill_in "NCBI Taxon ID", :with => "333"
    fill_in "USDA-ARS GRIN Taxon ID", :with => "555"
    select "Determinate", :from => "Nodulation Type"

    click_button "Add Nodulator"
    fill_in "phacn_content_new_nodulators_attributes__species", :with => "species"
    fill_in "phacn_content_new_nodulators_attributes__ncbi_taxon_id", :with => "1234"

    select "Short Day", :from => "Flowering Type"
    select "Wind", :from => "Pollination Type"
    select "Predominately Inbreeding", :from => "Mating System"

    click_button "Add Pathogen"
    fill_in "phacn_content_new_pathogens_attributes__name", :with => "pathogen"
    fill_in "phacn_content_new_pathogens_attributes__ncbi_taxon_id", :with => "777"

    fill_in "Number of Chromosomes", :with => "2"
    fill_in "Genome Size (Mbp)", :with => "10"
    select "Auto", :from => "Ploidy Type"
    fill_in "% GC Content of Genome", :with => "12"
    fill_in "% GC Content of Transcriptome", :with => "15"
    fill_in "Chloroplast Genome Size (kbp)", :with => "23"
    fill_in "Chloroplast NCBI Accession Number", :with => "67"
    fill_in "Mitochondria Genome Size (kbp)", :with => "88"
    fill_in "Mitochondria NCBI Accession Number", :with => "999"

    click_button "Add Resource"
    fill_in "phacn_content_new_resources_attributes__resource_type", :with => "resource"
    fill_in "phacn_content_new_resources_attributes__description", :with => "resource description"
    fill_in "phacn_content_new_resources_attributes__url", :with => "http://google.com"
    select "Yes", :from => "phacn_content_new_resources_attributes__is_public"

    click_button "Add Reference Dataset"
    select "Genomic Sequence", :from => "phacn_content_new_reference_datasets_attributes__reference_dataset_type"
    fill_in "phacn_content_new_reference_datasets_attributes__description", :with => "brief"
    fill_in "phacn_content_new_reference_datasets_attributes__source", :with => "Mr. T"
    fill_in "phacn_content_new_reference_datasets_attributes__url", :with => "http://google.com"
    select "Yes", :from => "phacn_content_new_reference_datasets_attributes__is_public"

    click_button "Update Contents"

    page.body.should include("Successfully updated contents.")
  end

  it "as admin" do
    user = create_user("admin")

    visit phacn_contents_path
    click_link "Sign In"

    click_link "Edit Contents"
    fill_in "NCBI Taxon ID", :with => "333"
    fill_in "USDA-ARS GRIN Taxon ID", :with => "555"
    select "Determinate", :from => "Nodulation Type"

    click_button "Add Nodulator"
    fill_in "phacn_content_new_nodulators_attributes__species", :with => "species"
    fill_in "phacn_content_new_nodulators_attributes__ncbi_taxon_id", :with => "1234"

    select "Short Day", :from => "Flowering Type"
    select "Wind", :from => "Pollination Type"
    select "Predominately Inbreeding", :from => "Mating System"

    click_button "Add Pathogen"
    fill_in "phacn_content_new_pathogens_attributes__name", :with => "pathogen"
    fill_in "phacn_content_new_pathogens_attributes__ncbi_taxon_id", :with => "777"

    fill_in "Number of Chromosomes", :with => "2"
    fill_in "Genome Size (Mbp)", :with => "10"
    select "Auto", :from => "Ploidy Type"
    fill_in "% GC Content of Genome", :with => "12"
    fill_in "% GC Content of Transcriptome", :with => "15"
    fill_in "Chloroplast Genome Size (kbp)", :with => "23"
    fill_in "Chloroplast NCBI Accession Number", :with => "67"
    fill_in "Mitochondria Genome Size (kbp)", :with => "88"
    fill_in "Mitochondria NCBI Accession Number", :with => "999"

    click_button "Add Resource"
    fill_in "phacn_content_new_resources_attributes__resource_type", :with => "resource"
    fill_in "phacn_content_new_resources_attributes__description", :with => "resource description"
    fill_in "phacn_content_new_resources_attributes__url", :with => "http://google.com"
    select "Yes", :from => "phacn_content_new_resources_attributes__is_public"

    find_button("Add Reference Dataset")['disabled'].should be_true

    click_button "Update Contents"

    page.body.should include("Successfully updated contents.")
  end

  it "should not be able as editor" do
    user = create_user("editor")

    visit phacn_contents_path
    click_link "Sign In"

    page.body.should_not include("Edit Contents")

    visit edit_phacn_content_path(@content.id)
    page.body.should include("Sorry, your account has insufficient privileges for the requested resource.")
  end

  it "should not be able as system_user" do
    user = create_user("system_user")

    visit phacn_contents_path
    click_link "Sign In"

    page.body.should_not include("Edit Contents")

    visit edit_phacn_content_path(@content.id)
    page.body.should include("Sorry, your account has insufficient privileges for the requested resource.")
  end

end

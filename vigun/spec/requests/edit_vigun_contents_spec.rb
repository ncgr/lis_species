require 'spec_helper'

describe "EditContents" do

  def create_user(role)
    @user = FactoryGirl.create(:user_information)
    role = Role.where({ :name => "#{role}" }).first
    UserRole.where({ :user_id => @user.id }).first.destroy
    UserRole.create!([{ :user_id => @user.id, :role_id => role.id }])
  end

  before(:each) do
    create_roles
    @content = FactoryGirl.create(:vigun_content)

    Capybara.current_driver = :selenium
    set_host "silicon.ncgr.org:53330"
  end

  # Skip CKEditor instance testing since it requires JavaScript.
  # Ex: CKEditor.isntances['id'].setData('foo')

  it "as superuser" do
    create_user("superuser")

    visit vigun_contents_path
    click_link "Sign In"
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "LOGIN"

    click_link "Edit Contents"
    fill_in "NCBI Taxon ID", :with => "333"
    fill_in "USDA-ARS GRIN Taxon ID", :with => "555"
    select "Determinate", :from => "Nodulation Type"

    click_button "Add Nodulator"
    fill_in "vigun_content_new_nodulators_attributes__species", :with => "species"
    fill_in "vigun_content_new_nodulators_attributes__ncbi_taxon_id", :with => "1234"

    select "Short Day", :from => "Flowering Type"
    select "Wind", :from => "Pollination Type"
    select "Predominately Inbreeding", :from => "Mating System"

    click_button "Add Pathogen"
    fill_in "vigun_content_new_pathogens_attributes__name", :with => "pathogen"
    fill_in "vigun_content_new_pathogens_attributes__ncbi_taxon_id", :with => "777"

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
    fill_in "vigun_content_new_resources_attributes__resource_type", :with => "resource"
    fill_in "vigun_content_new_resources_attributes__description", :with => "resource description"
    fill_in "vigun_content_new_resources_attributes__url", :with => "http://google.com"
    select "Yes", :from => "vigun_content_new_resources_attributes__is_public"

    click_button "Add Reference Dataset"
    select "Genomic Sequence", :from => "vigun_content_new_reference_datasets_attributes__reference_dataset_type"
    fill_in "vigun_content_new_reference_datasets_attributes__description", :with => "brief"
    fill_in "vigun_content_new_reference_datasets_attributes__source", :with => "Mr. T"
    fill_in "vigun_content_new_reference_datasets_attributes__url", :with => "http://google.com"
    select "Yes", :from => "vigun_content_new_reference_datasets_attributes__is_public"

    click_button "Update Contents"

    page.body.should include("Successfully updated contents.")
  end

  it "as admin" do
    create_user("admin")

    visit vigun_contents_path
    click_link "Sign In"
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "LOGIN"

    click_link "Edit Contents"
    fill_in "NCBI Taxon ID", :with => "333"
    fill_in "USDA-ARS GRIN Taxon ID", :with => "555"
    select "Determinate", :from => "Nodulation Type"

    click_button "Add Nodulator"
    fill_in "vigun_content_new_nodulators_attributes__species", :with => "species"
    fill_in "vigun_content_new_nodulators_attributes__ncbi_taxon_id", :with => "1234"

    select "Short Day", :from => "Flowering Type"
    select "Wind", :from => "Pollination Type"
    select "Predominately Inbreeding", :from => "Mating System"

    click_button "Add Pathogen"
    fill_in "vigun_content_new_pathogens_attributes__name", :with => "pathogen"
    fill_in "vigun_content_new_pathogens_attributes__ncbi_taxon_id", :with => "777"

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
    fill_in "vigun_content_new_resources_attributes__resource_type", :with => "resource"
    fill_in "vigun_content_new_resources_attributes__description", :with => "resource description"
    fill_in "vigun_content_new_resources_attributes__url", :with => "http://google.com"
    select "Yes", :from => "vigun_content_new_resources_attributes__is_public"

    find_button("Add Reference Dataset")['disabled'].should be_true

    click_button "Update Contents"

    page.body.should include("Successfully updated contents.")
  end

  it "should not be able as editor" do
    create_user("editor")

    visit vigun_contents_path
    click_link "Sign In"
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "LOGIN"

    page.body.should_not include("Edit Contents")

    visit edit_vigun_content_path(@content.id)
    page.body.should include("Sorry, your account has insufficient privileges for the requested resource.")
  end

  it "should not be able as system_user" do
    create_user("system_user")

    visit vigun_contents_path
    click_link "Sign In"
    fill_in "Username", with: @user.username
    fill_in "Password", with: @user.password
    click_button "LOGIN"

    page.body.should_not include("Edit Contents")

    visit edit_vigun_content_path(@content.id)
    page.body.should include("Sorry, your account has insufficient privileges for the requested resource.")
  end

  after(:all) do
    Capybara.use_default_driver
  end

end

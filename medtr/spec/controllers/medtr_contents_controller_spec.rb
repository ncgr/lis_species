require 'spec_helper'

describe MedtrContentsController do
  
  def mock_medtr_content(stubs={})
    @mock_medtr_content ||= mock_model(MedtrContent, stubs).as_null_object
  end

  before(:all) do
    create_roles
  end
  
  describe "GET index without logging in" do
    before(:each) do
      @medtr = Factory.build(:medtr_content)
    end
    it "should get index" do
      get :index
      response.should be_success
    end
  end
  
  describe "access restricted without logging in" do
    it "edit/:id should redirect" do
      get :edit, :id => "10"
      response.should be_redirect
    end
    it "update/:id should redirect" do
      put :update, :id => "10", :news_article => {}
      response.should be_redirect
    end
  end
  
  describe "GET edit and PUT update medtr_content while logged in as superuser" do
    login_superuser
    before(:each) do
      @medtr = Factory.build(:medtr_content)
      MedtrContent.should_receive(:find).with("21").and_return(@medtr)
    end
    it "should find medtr_content and return object" do
      get :edit, :id => "21"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "21", :medtr_content => {}
      response.should be_redirect
    end
  end
  
  describe "GET edit and PUT update medtr_content while logged in as admin" do
    login_admin
    before(:each) do
      @medtr = Factory.build(:medtr_content)
      MedtrContent.should_receive(:find).with("212").and_return(@medtr)
    end
    it "should find medtr_content and return object" do
      get :edit, :id => "212"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "212", :medtr_content => {}
      response.should be_redirect
    end
  end
  
  after(:all) do
    destroy_roles  
  end
  
end
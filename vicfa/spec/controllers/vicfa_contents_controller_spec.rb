require 'spec_helper'

describe VicfaContentsController do

  def mock_vicfa_content(stubs={})
    @mock_vicfa_content ||= mock_model(VicfaContent, stubs).as_null_object
  end

  before(:each) { create_roles }

  describe "GET index without logging in" do
    before(:each) do
      @vicfa = FactoryGirl.build(:vicfa_content)
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

  describe "GET index while logged in as superuser" do
    login_superuser
    it "should get index and set ckfinder_role cookie" do
      get :index
      response.should be_success
    end
  end

  describe "GET index while logged in as admin" do
    login_admin
    it "should get index and set ckfinder_role cookie" do
      get :index
      response.should be_success
    end
  end

  describe "GET index while logged in as editor" do
    login_editor
    it "should get index and set ckfinder_role cookie" do
      get :index
      response.should be_success
    end
  end

  describe "GET index while logged in as system_user" do
    login_system_user
    it "should get index and set ckfinder_role cookie" do
      get :index
      response.should be_success
    end
  end

  after(:all) { destroy_roles }

end

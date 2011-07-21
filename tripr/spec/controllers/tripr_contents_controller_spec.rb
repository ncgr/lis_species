require 'spec_helper'

describe TriprContentsController do
  
  def mock_tripr_content(stubs={})
    @mock_tripr_content ||= mock_model(TriprContent, stubs).as_null_object
  end

  #
  # Descode signed cookies created after a user successfully logs in.
  # app/controllers/application_controller.rb
  #
  def decode_signed_cookie(cookie)
    Base64.decode64(cookie.split('--').first).gsub(/[^a-z]/, '')
  end

  before(:all) { create_roles }
  
  describe "GET index without logging in" do
    before(:each) do
      @tripr = Factory.build(:tripr_content)
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
      request.cookies['ckfinder_role'] = nil
      get :index
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "superuser"
    end
  end
  
  describe "GET index while logged in as admin" do
    login_admin
    it "should get index and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :index
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "admin"
    end
  end
  
  describe "GET index while logged in as editor" do
    login_editor
    it "should get index and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :index
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "editor"
    end
  end
  
  describe "GET index while logged in as system_user" do
    login_system_user
    it "should get index and set ckfinder_role cookie" do
      request.cookies['ckfinder_role'] = nil
      get :index
      response.should be_success
      decode_signed_cookie(response.cookies['ckfinder_role']).should == "systemuser"
    end
  end
  
  describe "GET edit and PUT update tripr_content while logged in as superuser" do
    login_superuser
    before(:each) do
      @tripr = Factory.build(:tripr_content)
      TriprContent.should_receive(:find).with("21").and_return(@tripr)
    end
    it "should find tripr_content and return object" do
      get :edit, :id => "21"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "21", :tripr_content => {}
      response.should be_redirect
    end
  end
  
  describe "GET edit and PUT update tripr_content while logged in as admin" do
    login_admin
    before(:each) do
      @tripr = Factory.build(:tripr_content)
      TriprContent.should_receive(:find).with("212").and_return(@tripr)
    end
    it "should find tripr_content and return object" do
      get :edit, :id => "212"
      response.should render_template('edit')
    end
    it "should update object" do
      put :update, :id => "212", :tripr_content => {}
      response.should be_redirect
    end
  end
  
  after(:all) { destroy_roles }
  
end

module ControllerMacros
  def login_superuser
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user_information)
      @user = User.find(@user.id)

      # Set role to superuser
      role = Role.where({:name => "superuser"}).first
      added = []
      added << {:user_id => @user.id, :role_id => role.id}
      UserRole.create!(added)

      sign_in @user
    end
  end

  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user_information)
      @user = User.find(@user.id)

      # Set role to admin
      role = Role.where({:name => "admin"}).first
      added = []
      added << {:user_id => @user.id, :role_id => role.id}
      UserRole.create!(added)

      sign_in @user
    end
  end
  
  def login_editor
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user_information)
      @user = User.find(@user.id)

      # Set role to editor
      role = Role.where({:name => "editor"}).first
      added = []
      added << {:user_id => @user.id, :role_id => role.id}
      UserRole.create!(added)

      sign_in @user
    end
  end
  
  # 
  # Default role is set to system_user in UserInformation after_create.
  #
  def login_system_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:user_information)
      @user = User.find(@user.id)
      sign_in @user
    end
  end
end


module UserMacros

  def create_user(role)
    user = FactoryGirl.create(:user_information)
    role = Role.where({ :name => "#{role}" }).first
    UserRole.where({ :user_id => user.id }).first.destroy
    UserRole.create!([{ :user_id => user.id, :role_id => role.id }])
    user
  end

end

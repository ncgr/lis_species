module RoleMacros

  def create_roles
    ["superuser","admin","editor","system_user"].each { |r| Role.create!(:name => r) }
  end

  def destroy_roles
    Role.all.each { |r| r.destroy }
  end

end

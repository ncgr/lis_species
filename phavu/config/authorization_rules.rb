# Roles for declarative_authorization

# roles table in db:
# '1', 'superuser'
# '2', 'admin'
# '3', 'editor'
# '4', 'system_user'

authorization do
    
  role :base do
   has_permission_on :phavu_contents, :to => [:read]
  end
    
  role :superuser do
    includes :base
    has_permission_on :phavu_contents, :to => [:manage]
  end
    
  role :admin do
    includes :base
    has_permission_on :phavu_contents, :to => [:update]
  end

  role :editor do
    includes :base
  end
    
  role :system_user do
    includes :base
  end
    
end

privileges do
  # Default privilege hierarchies to facilitate RESTful Rails apps.
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
end


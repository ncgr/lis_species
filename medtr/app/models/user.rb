
class User < ActiveRecord::Base

  belongs_to :role

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :timeoutable, :omniauthable
  # :database_authenticatable --> Replaced by cas_authenticatable <--
  # :validatable, :lockable, :rememberable, :registerable
  devise :cas_authenticatable, :trackable

  #
  # Extra Attributes defined in Ruby CAS Server
  #
  def cas_extra_attributes=(extra_attributes)
    extra_attributes.each do |name, value|
      case name.to_sym
      when :first_name
        self.first_name = value
      when :last_name
        self.last_name = value
      when :role_id
        self.role_id = value
      end
    end
  end

  #
  # Find all User Roles
  #
  def get_user_roles
    roles = Role.select("name").all
    roles.map {|n| n.name.to_sym}
  end

  #
  # Helper to check user's role.
  #
  def has_role? (role)
    (self.role.name.to_sym == role.to_sym) && (self.get_user_roles.include? role.to_sym)
  end  

end

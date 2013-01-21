class User < ActiveRecord::Base

  has_many :user_roles, :dependent => :destroy
  has_many :roles, :through => :user_roles

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
      end
    end
  end

  #
  # Declarative authorization method
  #
  def role_symbols
    (roles || []).map {|r| r.name.to_sym}
  end

end

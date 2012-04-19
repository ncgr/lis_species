## THIS MODEL IS FOR TESTING ONLY ##
#
# Ken Seal - NCGR
#
# This model handles the registration and recovery of our users NOT
# the authentication. The authentication is handled by the model
# User which includes the devise module devise_cas_authenticatable.
# See https://github.com/nbudin/devise_cas_authenticatable for more
# information.
#
class UserInformation < ActiveRecord::Base

  # Use the table users.
  set_table_name "users"

  before_save :format_user_information, :if => :should_validate?
  after_create :set_user_role

  # Set devise modules
  #
  # NOTE: We are using authlogic_sha512 encryption because it's
  # compatible with Ruby CAS Server Authlogic encryptor.
  # See https://github.com/gunark/rubycas-server for more information.
  devise :database_authenticatable, :registerable,
    :recoverable, :encryptable, :encryptor => :authlogic_sha512,
    :stretches => 20

  attr_accessible :username, :password, :password_confirmation,
    :first_name, :last_name

  validates_format_of :username,
    :with => /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i,
    :message => " is invalid. Please enter a valid email address."
  validates_uniqueness_of :username,
    :message => " is invalid. The email address you entered already exists."

  validates_length_of :password, :in => 6..20,
    :if => :should_validate?
  validates_confirmation_of :password, :message => " did not match.",
    :if => :should_validate?

  validates_length_of :first_name, :minimum => 3,
    :if => :should_validate?
  validates_length_of :last_name, :minimum => 3,
    :if => :should_validate?

  #
  # Only validate if we need to.
  #
  def should_validate?
    # Catch the rest.
    if self.new_record? || !self.reset_password_token.blank? || !password.blank?
      return true
    else
      return false
    end
  end

  #
  # Format user information.
  #
  def format_user_information
    self.first_name.capitalize!
    self.last_name.capitalize!
  end

  #
  # Set User role to default.
  #
  def set_user_role
    role = Role.where({ :name => "system_user" }).first
    raise RuntimeError, "Error: unable to find role: system_user" unless role
    user_role = UserRole.new
    user_role.role_id = role.id
    user_role.user_id = self.id
    user_role.save!
  end

end

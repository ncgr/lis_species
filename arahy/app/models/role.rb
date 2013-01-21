class Role < ActiveRecord::Base
  has_many :user_roles
  attr_accessible :name
end

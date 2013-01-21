class VicfaSelectedReference < ActiveRecord::Base
  belongs_to :vicfa_content
  attr_accessible :selected_references, :vicfa_content_id
end

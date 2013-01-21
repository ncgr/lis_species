class PhacnSelectedReference < ActiveRecord::Base
  belongs_to :phacn_content
  attr_accessible :selected_references, :phacn_content_id
end

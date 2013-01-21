class ArahySelectedReference < ActiveRecord::Base
  belongs_to :arahy_content
  attr_accessible :selected_references, :arahy_content_id
end

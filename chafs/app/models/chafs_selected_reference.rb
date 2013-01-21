class ChafsSelectedReference < ActiveRecord::Base
  belongs_to :chafs_content
  attr_accessible :selected_references, :chafs_content_id
end

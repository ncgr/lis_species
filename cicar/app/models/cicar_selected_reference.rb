class CicarSelectedReference < ActiveRecord::Base
  belongs_to :cicar_content
  attr_accessible :selected_references, :cicar_content_id
end

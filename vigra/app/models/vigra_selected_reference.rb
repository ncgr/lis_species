class VigraSelectedReference < ActiveRecord::Base
  belongs_to :vigra_content
  attr_accessible :selected_references, :vigra_content_id
end

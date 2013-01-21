class PeaSelectedReference < ActiveRecord::Base
  belongs_to :pea_content
  attr_accessible :selected_references, :pea_content_id
end

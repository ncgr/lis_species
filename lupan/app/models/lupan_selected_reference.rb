class LupanSelectedReference < ActiveRecord::Base
  belongs_to :lupan_content
  attr_accessible :selected_references, :lupan_content_id
end

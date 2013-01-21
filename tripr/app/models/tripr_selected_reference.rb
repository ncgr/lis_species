class TriprSelectedReference < ActiveRecord::Base
  belongs_to :tripr_content
  attr_accessible :selected_references, :tripr_content_id
end

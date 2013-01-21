class LencuSelectedReference < ActiveRecord::Base
  belongs_to :lencu_content
  attr_accessible :selected_references, :lencu_content_id
end

class LupalSelectedReference < ActiveRecord::Base
  belongs_to :lupal_content
  attr_accessible :selected_references, :lupal_content_id
end

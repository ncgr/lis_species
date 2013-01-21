class LotjaSelectedReference < ActiveRecord::Base
  belongs_to :lotja_content
  attr_accessible :selected_references, :lotja_content_id
end

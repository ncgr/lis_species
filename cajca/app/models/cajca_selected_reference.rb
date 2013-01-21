class CajcaSelectedReference < ActiveRecord::Base
  belongs_to :cajca_content
  attr_accessible :selected_references, :cajca_content_id
end

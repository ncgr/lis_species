class GlymaSelectedReference < ActiveRecord::Base
  belongs_to :glyma_content
  attr_accessible :selected_references, :glyma_content_id
end

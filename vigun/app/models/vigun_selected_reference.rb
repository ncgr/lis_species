class VigunSelectedReference < ActiveRecord::Base
  belongs_to :vigun_content
  attr_accessible :selected_references, :vigun_content_id
end

class PhavuSelectedReference < ActiveRecord::Base
  belongs_to :phavu_content
  attr_accessible :selected_references, :phavu_content_id
end

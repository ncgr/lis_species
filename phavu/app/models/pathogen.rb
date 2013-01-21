class Pathogen < ActiveRecord::Base
  belongs_to :phavu_content, :foreign_key => "legume_id"
end

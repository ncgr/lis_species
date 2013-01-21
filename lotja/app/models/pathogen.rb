class Pathogen < ActiveRecord::Base
  belongs_to :lotja_content, :foreign_key => "legume_id"
end

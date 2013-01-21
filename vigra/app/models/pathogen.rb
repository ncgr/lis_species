class Pathogen < ActiveRecord::Base
  belongs_to :vigra_content, :foreign_key => "legume_id"
end

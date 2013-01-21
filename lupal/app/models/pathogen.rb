class Pathogen < ActiveRecord::Base
  belongs_to :lupal_content, :foreign_key => "legume_id"
end

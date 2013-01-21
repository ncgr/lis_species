class Pathogen < ActiveRecord::Base
  belongs_to :arahy_content, :foreign_key => "legume_id"
end

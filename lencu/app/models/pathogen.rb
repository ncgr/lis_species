class Pathogen < ActiveRecord::Base
  belongs_to :lencu_content, :foreign_key => "legume_id"
end

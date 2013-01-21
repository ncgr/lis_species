class Pathogen < ActiveRecord::Base
  belongs_to :cicar_content, :foreign_key => "legume_id"
end

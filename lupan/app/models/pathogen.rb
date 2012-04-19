
class Pathogen < ActiveRecord::Base
  belongs_to :lupan_content, :foreign_key => "legume_id"
end


class Nodulator < ActiveRecord::Base
  belongs_to :phacn_content, :foreign_key => "legume_id"
end

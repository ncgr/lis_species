
class Nodulator < ActiveRecord::Base
  belongs_to :chafs_content, :foreign_key => "legume_id"
end

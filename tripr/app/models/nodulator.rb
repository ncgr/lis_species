class Nodulator < ActiveRecord::Base
  belongs_to :tripr_content, :foreign_key => "legume_id"
end

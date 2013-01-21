class Nodulator < ActiveRecord::Base
  belongs_to :vigun_content, :foreign_key => "legume_id"
end

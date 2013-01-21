class Nodulator < ActiveRecord::Base
  belongs_to :pea_content, :foreign_key => "legume_id"
end

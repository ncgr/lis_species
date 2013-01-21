class Nodulator < ActiveRecord::Base
  belongs_to :medtr_content, :foreign_key => "legume_id"
end

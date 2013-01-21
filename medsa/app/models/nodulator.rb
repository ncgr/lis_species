class Nodulator < ActiveRecord::Base
  belongs_to :medsa_content, :foreign_key => "legume_id"
end

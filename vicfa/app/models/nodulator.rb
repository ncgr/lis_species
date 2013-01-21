class Nodulator < ActiveRecord::Base
  belongs_to :vicfa_content, :foreign_key => "legume_id"
end

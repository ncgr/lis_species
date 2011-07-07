
class Nodulator < ActiveRecord::Base
  belongs_to :cajca_content, :foreign_key => "legume_id"
end

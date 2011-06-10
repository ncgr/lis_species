
class Pathogen < ActiveRecord::Base
  belongs_to :glyma_content, :foreign_key => "legume_id"
end
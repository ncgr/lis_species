class MedsaSelectedReference < ActiveRecord::Base
  belongs_to :medsa_content
  attr_accessible :selected_references, :medsa_content_id
end

class MedtrSelectedReference < ActiveRecord::Base
  belongs_to :medtr_content
  attr_accessible :selected_references, :medtr_content_id
end

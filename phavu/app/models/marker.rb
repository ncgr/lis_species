class Marker < ActiveRecord::Base
  belongs_to :phavu_content,
    :foreign_key => "organism_id"

end

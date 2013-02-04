class QtlExperiment < ActiveRecord::Base
  belongs_to :phavu_content,
    :foreign_key => "organism_id"

  attr_accessible :pub_id, :title, :ename, :description, :comment

end

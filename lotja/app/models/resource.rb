
class Resource < ActiveRecord::Base
  default_scope :conditions => "is_public = 1", 
    :order => "resource_type ASC"
  
  belongs_to :lotja_content, 
    :foreign_key => "legume_id"
  
  validates_format_of :url, :with => URI::regexp(%w(http https ftp)),
    :allow_blank => true, :message => ' is not valid. Please include a valid protocol.'
end
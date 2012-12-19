class Page < ActiveRecord::Base
  attr_accessible :title, :desc, :meta_desc, :meta_key, :meta_title
  
  has_friendly_id :title, :use_slug => true
  
end

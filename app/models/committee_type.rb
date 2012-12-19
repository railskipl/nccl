class CommitteeType < ActiveRecord::Base
  attr_accessible :title
  has_friendly_id :title, :use_slug => true
end

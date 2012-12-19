class Press < ActiveRecord::Base
   attr_accessible :title,:photo
   has_attached_file :photo,:styles =>{:small => "150x150>" }
end

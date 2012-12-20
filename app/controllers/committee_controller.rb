require 'will_paginate/array' 
class CommitteeController < ApplicationController
  
  def show
    @committee_type = CommitteeType.find(params[:id]) 
    
    @meta_title = "Nagpur Chamber Of Commerce Limited - #{@committee_type.title}"
  end
  
end

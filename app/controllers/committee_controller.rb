require 'will_paginate/array' 
class CommitteeController < ApplicationController
  
  def show
    @committee_type = CommitteeType.find(params[:id]) 
  end
  
end

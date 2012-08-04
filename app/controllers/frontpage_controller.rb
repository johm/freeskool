class FrontpageController < ApplicationController

  def index
    @courses=Course.upcoming.approved.uniq
  end


end

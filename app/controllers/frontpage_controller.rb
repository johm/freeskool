class FrontpageController < ApplicationController

  def index
    @courses=Course.upcoming.approved.ispublic.uniq
  end


end

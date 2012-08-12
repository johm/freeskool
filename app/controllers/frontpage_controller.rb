class FrontpageController < ApplicationController

  def index
    @courses=Course.upcoming.approved.ispublic.uniq.order('created_at DESC,id DESC')
  end


end

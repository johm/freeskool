class FrontpageController < ApplicationController

  def index
    @courses=Course.upcoming.approved.ispublic.order('created_at DESC,id DESC').uniq
  end


end

class FrontpageController < ApplicationController

  def index
    @courses=Course.approved
  end


end

class FrontpageController < ApplicationController

  def index
    @courses=Course.all
  end


end

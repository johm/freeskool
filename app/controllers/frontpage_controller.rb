class FrontpageController < ApplicationController

  def index
    @courses=Course.upcoming.approved.ispublic.order('created_at DESC,id DESC').uniq
    respond_to do |format|
      format.html 
      format.pdf do
        render :pdf => "freeschool_calendar.pdf",
        :template => 'frontpage/calendar.pdf.erb',
        :page_size => 'Legal',
        :layout => false,
        :orientation      => 'Portrait', # default , Landscape
        :dpi              => '300',
        :print_media_type => true,
        :no_background    => true,
        :show_as_html     => params[:debug].present?      # allow debuging based on url param

      end
    end
  end
end

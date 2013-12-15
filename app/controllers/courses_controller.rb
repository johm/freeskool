class CoursesController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception| 
    redirect_to '/users/sign_in', :notice => 'Please log in or create an account.  Once you do so, return to this page and you can propose a course you want to teach, or a workshop you would like to run.'
  end


  # GET /courses
  # GET /courses.json
  def index
    @showmine = true if params[:mine]
    if @showmine
      @courses = Course.where(:user_id=>current_user) + current_user.registered_courses
    elsif !current_user.nil? && (current_user.has_role? :admin)
      @courses.all
    else
      @courses=Course.upcoming.approved.ispublic.uniq
    end

    @courses.sort_by(&:created_at)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @courses }
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    @course = Course.find(params[:id])
    @qr = RQRCode::QRCode.new( "http://freeschool.redemmas.org/courses/#{@course.id}", :size => 5, :level => :h )
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course }
      format.pdf do
        render :pdf => "freeschool_course_poster.pdf",
               :template => 'courses/show.pdf.erb',
#        :disposition  => 'attachment',
        :page_size => 'Letter',
        :layout => false
      end
    end
  end

  # GET /courses/new
  # GET /courses/new.json
  def new

    @course = Course.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course }
    end
  end

  # GET /courses/1/edit
  def edit
    @course = Course.find(params[:id])
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(params[:course])
    @course.instructor=current_user

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, :notice => 'Course was successfully submitted.  <div class="nowdothis">Now indicate which sessions you would like to reserve at the Free School by adding them on the right</div>'.html_safe }
        format.json { render :json => @course, :status => :created, :location => @course }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /courses/1
  # PUT /courses/1.json
  def update
    @course = Course.find(params[:id])

    respond_to do |format|
      if @course.update_attributes(params[:course])
        format.html { redirect_to @course, :notice => 'Course was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :ok }
    end
  end

  def calendar 
    cal=MyCalendar.new(Course.upcoming)
    respond_to do |format|
      format.ics { render :text => cal.export }
    end
  end


end

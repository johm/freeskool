class CourseSessionsController < ApplicationController
  # GET /course_sessions
  # GET /course_sessions.json
  def index
    @course_sessions = CourseSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @course_sessions }
    end
  end

  # GET /course_sessions/1
  # GET /course_sessions/1.json
  def show
    @course_session = CourseSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @course_session }
    end
  end

  # GET /course_sessions/new
  # GET /course_sessions/new.json
  def new
    @course_session = CourseSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @course_session }
    end
  end

  # GET /course_sessions/1/edit
  def edit
    @course_session = CourseSession.find(params[:id])
  end

  # POST /course_sessions
  # POST /course_sessions.json
  def create
    @course_session = CourseSession.new(params[:course_session])

    respond_to do |format|
      if @course_session.save
        format.html { redirect_to @course_session, :notice => 'CourseSession was successfully created.' }
        format.json { render :json => @course_session, :status => :created, :location => @course_session }
      else
        format.html { render :action => "new" }
        format.json { render :json => @course_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /course_sessions/1
  # PUT /course_sessions/1.json
  def update
    @course_session = CourseSession.find(params[:id])

    respond_to do |format|
      if @course_session.update_attributes(params[:course_session])
        format.html { redirect_to @course_session, :notice => 'Course session was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @course_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /course_sessions/1
  # DELETE /course_sessions/1.json
  def destroy
    @course_session = CourseSession.find(params[:id])
    @course_session.destroy

    respond_to do |format|
      format.html { redirect_to course_sessions_url }
      format.json { head :ok }
    end
  end
end

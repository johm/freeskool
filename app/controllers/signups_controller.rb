class SignupsController < ApplicationController
  # GET /signups
  # GET /signups.json
  def index
    @signups = Signup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @signups }
    end
  end

  # GET /signups/1
  # GET /signups/1.json
  def show
    @signup = Signup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @signup }
    end
  end

  # GET /signups/new
  # GET /signups/new.json
  def new
    @signup = Signup.new
    @course = Course.find(params[:course_id])
    if ! (current_user.nil? || !@course.is_approved? || @course.is_private )
      @signup.user=current_user
      @signup.course=@course
      @signup.save!
    end
    
    respond_to do |format|
      format.html { redirect_to @signup.course, :notice => 'You have successfully registered for this course!' } # new.html.erb
      format.json { render :json => @signup }
    end
  end

  # GET /signups/1/edit
  def edit
    @signup = Signup.find(params[:id])
  end

  # POST /signups
  # POST /signups.json
  def create
    @signup = Signup.new(params[:signup])

    respond_to do |format|
      if @signup.save
        format.html { redirect_to @signup, :notice => 'Signup was successfully created.' }
        format.json { render :json => @signup, :status => :created, :location => @signup }
      else
        format.html { render :action => "new" }
        format.json { render :json => @signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /signups/1
  # PUT /signups/1.json
  def update
    @signup = Signup.find(params[:id])

    respond_to do |format|
      if @signup.update_attributes(params[:signup])
        format.html { redirect_to @signup, :notice => 'Signup was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @signup.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /signups/1
  # DELETE /signups/1.json
  def destroy
    @signup = Signup.find(params[:id])
    @signup.destroy

    respond_to do |format|
      format.html { redirect_to signups_url }
      format.json { head :ok }
    end
  end
end

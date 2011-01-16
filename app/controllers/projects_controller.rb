class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.xml
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end
  
  def on_map
    @projects = Project.all.excludes(:map_point => nil).limit(250)
    i = 0
    @project_markers = @projects.map { |pro| pro.to_marker }
       
    ap @project_markers
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    @projects = Project.all.excludes(:map_point => nil).limit(100)
    @project_markers = @projects.map { |pro| pro.to_marker }

    @map_center = @project.map_point.join(", ")
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    ap params[:project]
    ap params[:project][:map_point]
    params[:project][:map_point] = params[:project][:map_point].gsub(/[\(\)]/, "").split(',').map {|s| s.to_f}
    ap params[:project]
    @project = Project.new(params[:project])


    respond_to do |format|
      if @project.save
        format.html { redirect_to(@project, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    
    respond_to do |format|
      ap params[:project]
      ap params[:project][:map_point]
      params[:project][:map_point] = params[:project][:map_point].gsub(/[\(\)]/, "").split(',').map {|s| s.to_f}
      ap params[:project]
      if @project.update_attributes(params[:project])
        format.html { redirect_to(@project, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end

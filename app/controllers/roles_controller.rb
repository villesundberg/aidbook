class RolesController < ApplicationController

  def create

    @role = Role.create
    
    @person = Person.find params[:person_id]
    @project = Project.find params[:project_id]

    @project.roles << @role
    @project.save

    @person.roles << @role
    @person.save
    
    respond_to do |format|
      if @person.save && @project.save
        format.html { redirect_to(@person, :notice => 'Role was successfully created.') }
        format.xml  { render :nothing => true, :status => :created }
      else
        format.html { redirect_to(@person, :notice => 'There was a problem adding this project .') }
        format.xml  { render :nothing => true, :status => :unprocessable_entity }
      end
    end
  end
  
end

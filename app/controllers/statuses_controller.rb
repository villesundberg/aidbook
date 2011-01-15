class StatusesController < ApplicationController

  def show
    @status = Status.find params[:id]

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @status }
    end
  end
    
  def create
    @status = Status.new(params[:status])
    @status.time = DateTime.now
    @person = Person.find(params[:status][:person_id])
    @person.statuses << @status
    
    respond_to do |format|
      if @status.save
        format.html { redirect_to(@person, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @status, :status => :created }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @status.errors, :status => :unprocessable_entity }
      end
    end
  end

  
end

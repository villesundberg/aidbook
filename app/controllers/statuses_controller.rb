class StatusesController < ApplicationController

  def create

    ap params[:status]
    
    @status = Status.new(params[:status])
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

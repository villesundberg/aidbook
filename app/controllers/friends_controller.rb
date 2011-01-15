class FriendsController < ApplicationController

  def create
    @person = Person.find params[:person_id]
    ap Person.all.to_a
    @friend = Person.find params[:friend_id]

    ap @person
    ap @friend

    @person.friends << @friend
    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'Friend was successfully added.') }
        format.xml  { render :nothing => true, :status => :created }
      else
        format.html { redirect_to(@person, :notice => 'There was a problem adding this friend.') }
        format.xml  { render :nothing => true, :status => :unprocessable_entity }
      end
    end
  end
  
end

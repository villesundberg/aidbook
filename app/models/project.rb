class Project
  include Mongoid::Document
  field :name, :type => String
  field :map_point, :type => Array   # [Y, X]

  field :beginning, :type => Date
  field :ending, :type => Date
  
  references_many :roles

  def people
    roles.map{ |r| r.person }.flatten
  end
  
  def feed
    people.map{|p| p.statuses}.flatten
  end

  def past?
    ending && ending < Date.today
  end

  def future?
    beginning && beginning > Date.today
  end
  
  index [[ :map_point, Mongo::GEO2D ]]
end

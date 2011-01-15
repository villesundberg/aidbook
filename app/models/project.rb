class Project
  include Mongoid::Document
  field :name, :type => String
  field :map_point, :type => Array   # [Y, X]

  references_many :roles

  def people
    roles.map{ |r| r.person }.flatten
  end
  
  def feed
    people.map{|p| p.statuses}.flatten
  end
  
  index [[ :map_point, Mongo::GEO2D ]]
end

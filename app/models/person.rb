class Person
  include Mongoid::Document
  field :name, :type => String
  field :img_url, :type => String
  
  references_many :friends, :class_name => "Person"
  
  references_many :statuses, :inverse_of => :person

  references_many :roles

  def projects
    roles.map{ |r| r.project }
  end
  
  field :last_location, :type => Array  # [Y, X]

  index [[ :last_location, Mongo::GEO2D ]]
end

class Status
  include Mongoid::Document
  field :status, :type => String
  field :time, :type => DateTime
  references_one :person
  referenced_in :person, :inverse_of => :statuses
end

class Role
  include Mongoid::Document
  field :title, :type => String
  referenced_in :person
  referenced_in :project
end



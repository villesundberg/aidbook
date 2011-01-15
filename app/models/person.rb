class Person
  include Mongoid::Document
  field :name, :type => String
  field :img_url, :type => String
  
  references_many :friends, :class_name => "Person"
  
  references_many :statuses
  references_many :projects, :inverse_of => :people
  field :last_location, :type => Array  # [Y, X]

  index [[ :last_location, Mongo::GEO2D ]]
end

class Status
  include Mongoid::Document
  field :status, :type => String
  references_one :person
  referenced_in :person
end

class Role
  include Mongoid::Document
  field :title, :type => String
  references_one :person
  references_one :project
end



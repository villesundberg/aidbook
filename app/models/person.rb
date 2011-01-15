class Person
  include Mongoid::Document
  field :name, :type => String
  references_many :friends, :class_name => "Person"
  
  references_many :statuses
  field :last_location, :type => Array  # [Y, X]

  index [[ :location, Mongo::GEO2D ]]
end

class Status
  include Mongoid::Document
  field :status, :type => String
  references_one :person
end

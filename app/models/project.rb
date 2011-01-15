class Project
  include Mongoid::Document
  field :name, :type => String
  field :map_point, :type => Array   # [Y, X]

  references_many :people, :inverse_of => :projects
  references_many :organisations, :inverse_of => :projects

  index [[ :map_point, Mongo::GEO2D ]]
end

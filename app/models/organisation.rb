class Organisation
  include Mongoid::Document
  field :name, :type => String
  
  references_many :projects, :inverse_of => :organisations
  
end

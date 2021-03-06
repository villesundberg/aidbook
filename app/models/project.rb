class Project
  include Mongoid::Document
  field :name, :type => String
  field :map_point, :type => Array   # [Y, X]

  field :beginning, :type => Date
  field :ending, :type => Date

  field :description, :type => String
  field :country_code, :type => String
  
  references_many :roles

  def people
    roles.map{ |r| r.person }.flatten
  end
  
  def feed
    Status.all
  end

  def past?
    ending && ending < Date.today
  end

  def future?
    beginning && beginning > Date.today
  end

  def readable_beginning
    format(beginning)
  end

  def readable_ending
    format(ending)
  end

  def to_marker
      { 
        :latlng => self.map_point.andand.map {|mp| mp.to_s}.join(", "),   
        :project => self,
        :past => self.past?,
        :future => self.future?
      }
  end

  def nearest
    Project.demo
  end

  def self.demo

    # 
    Project.all.in(:country_code => ["GH", "CI", "TG", "BF", "BJ", "LR", "NG", "GN"]).excludes(:map_point => nil)
  end

  
  index [[ :map_point, Mongo::GEO2D ]]
  
  private

  def format(date)
    date.andand.strftime("%B %Y")
  end
end

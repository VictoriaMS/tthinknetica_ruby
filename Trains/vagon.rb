class Vagon 
  @@vagons = []

  def self.vagons
    @@vagons 
  end 

  def initialize 
    @@vagons << self
  end

end
class Wagon 
  @@wagons = []

  def self.all
    @@wagons 
  end 

  def initialize 
    @@wagons << self
  end
end

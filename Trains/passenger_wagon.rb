class PassengerWagon < Wagon
  attr_accessor :occupied_places
  attr_reader :places

  def initialize(places)
    super()
    @places = places
    @occupied_places = 0 
  end
  
  def take_the_place
    self.occupied_places += 1
  end  

  def free_places
    places - occupied_places
  end

end 

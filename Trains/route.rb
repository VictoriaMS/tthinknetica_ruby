class Route 
  @@routes = []

  def self.all
    @@routes
  end

  attr_accessor :stations

  def initialize(first_station, last_station)
    @stations = [first_station, last_station]
    @@routes << self
    validate!
  end

  def valid?
    validate!
  rescue 
    false 
  end

  def add_station(station)
    stations.insert(-2, station)
  end

  def delete_station(station)
    stations.delete(station)
  end

  def list_station
    @stations
  end 

  private 
  def validate! 
    raise 'No such station exists' if stations.first.class != Station || stations.last.class != Station
    true
  end
end

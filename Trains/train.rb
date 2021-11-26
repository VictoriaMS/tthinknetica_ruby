class Train 
  attr_accessor :speed, :count_vagons, :route, :station_index
  attr_reader :type 
  @@trains = []

  def self.trains
    @@trains
  end
  attr_accessor :speed, :vagons, :route
  attr_reader :number

  def initialize(number)
    @number = number 
    @vagons = []
    @speed = 0
    @@trains << self
  end 
  
  def pick_up_speed
    self.speed += 10 
  end

  def stop 
    self.speed = 0
  end
  
  def attach_vagon(vagon)
    if speed.zero?
      vagons << vagon
    else 
      puts 'you cannot attach a vagon while the train is moving'
    end
  end 
  
  def unhook_vagon(vagon)
    if speed.zero? && count_vagons != 0
      vagons.delete(vagon)
    else 
      puts 'you cannot unhook a vagon while the train is moving'
    end
  end 
   
  def route=(route)
    @route = route 
    @station_index = 0
  end

  def current_station
    route.stations[station_index]
  end
  
  def next_station 
    route.stations[station_index + 1]

  end 
  
  def previous_station
    route.stations[station_index - 1] if station_index != 0 
  end 
  
  def moving_forward 
    if next_station
      current_station.send_train(self)
      next_station.accept_train(self)
    end
  end

  def moving_back
    current_station.send_train(self)
    previous_station.accept_train(self)
  end
end 

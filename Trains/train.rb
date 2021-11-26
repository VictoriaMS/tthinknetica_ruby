class Train 
  attr_accessor :speed, :wagons, :route, :station_index
  attr_reader :type, :number
  @@trains = []

  def self.all
    @@trains
  end

  def initialize(number)
    @number = number 
    @vagons = []
    @speed = 0
    @route = nil
    @@trains << self
  end 
  
  def pick_up_speed
    self.speed += 10 
  end

  def stop 
    self.speed = 0
  end
  
  def attach_wagon(wagon)
    if speed.zero?
      wagons << wagon
    else 
      puts 'you cannot attach a wagon while the train is moving'
    end
  end 
  
  def unhook_wagon(wagon)
    if speed.zero? && wagons.count != 0
      wagons.delete(wagon)
    else 
      puts 'you cannot unhook a wagon while the train is moving'
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

class Train 
  attr_accessor :speed, :count_vagons, :route
  attr_reader :type 

  def initialize(number, type, count_vagons)
    @number = number 
    @type = type 
    @count_vagons = count_vagons
    @speed = 0
    @route = nil
  end 
  
  def pick_up_speed
    self.speed += 10 
  end

  def stop 
    self.speed = 0
  end
  
  def attach_vagon 
    if speed == 0 
      self.count_vagons += 1
    else 
      puts 'you cannot attach a vagon while the train is moving'
    end
  end 
  
  def unhook_vagon
    if speed == 0 
      self.count_vagons -= 1
    else 
      puts 'you cannot unhook a vagon while the train is moving'
    end
  end 
   
  def route=(route)
    @route = route 
    route.stations.first.accept_train(self)
  end

  def current_station
    route.stations.select{ |station| station.trains.include?(self) }[0]
  end
  
  def next_station 
  index_current_station + 1 >= route.stations.size ? route.stations[0] : route.stations[index_current_station + 1]

  end 
  
  def previous_station
    route.stations[index_current_station- 1]
  end 
  
  def moving_forward 
    station = current_station
    next_station.accept_train(self)
    station.send_train(self)
  end

  def moving_back
    station = current_station
    previous_station.accept_train(self)
    station.send_train(self)
  end

  private 

  def index_current_station
    route.stations.index(current_station)
  end 

end 

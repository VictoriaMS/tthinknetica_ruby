class Train 
  include ManufactureCompany
  include InstanceCounter

  @@trains = []

  def self.all
    @@trains
  end

  def self.find(number)
    @@trains.select{|train| train.number == number}[0]
  end

  attr_accessor :speed, :vagons, :route
  attr_reader :number

  def initialize(number)
    @number = number 
    @vagons = []
    @speed = 0
    @route = nil
    @@trains << self
    register_instance
  end 
  
  def pick_up_speed
    self.speed += 10 
  end

  def stop 
    self.speed = 0
  end
  
  def attach_vagon(vagon) 
    if speed == 0 
      vagons << vagon
    else 
      puts 'you cannot attach a vagon while the train is moving'
    end
  end 
  
  def unhook_vagon(vagon)
    if speed == 0 
      vagons.delete(vagon)
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

  #этот метод не нужен для управления поезда

  def index_current_station
    route.stations.index(current_station)
  end 

end 

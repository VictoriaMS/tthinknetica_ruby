class Train 
  include ManufactureCompany
  include InstanceCounter

  FORMAT_NUMBER = /^\w{3}(-)?\w{2}$/

  @@trains = []

  def self.all
    @@trains
  end

  def self.find(number)
    @@trains.select{|train| train.number == number}[0]
  end

  attr_accessor :speed, :wagons, :route, :number

  def initialize(number)
    @number = number 
    @wagons = []
    @speed = 0
    @route = nil
    validate!
    @@trains << self
    register_instance
  end 

  def valid?
    validate!
  rescue
    false
  end
  
  def each_wagon(&block)
    wagons.each{|wagon| yield(wagon)}
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
    if speed == 0 
      wagons.delete(wagon)
    else 
      puts 'you cannot unhook a wagon while the train is moving'
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

  protected

  def validate! 
    raise 'The number must be 6 characters long' if number.length < 5
    raise 'The number does not match the format' if number !~ FORMAT_NUMBER
    true
  end

  #этот метод не нужен для управления поезда

  def index_current_station
    route.stations.index(current_station)
  end 

end 

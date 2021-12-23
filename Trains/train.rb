class Train
include Validation

  FORMAT_NUMBER = /^\w{3}(-)?\w{2}$/

  @@trains = []

  def self.all
    @@trains
  end

  def self.find(number)
    @@trains.select { |train| train.number == number }[0]
  end

  attr_accessor :speed, :wagons, :route, :number

  validate :number, :format, FORMAT_NUMBER

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
    validate!
    @@trains << self
  end

  def each_wagon
    wagons.each(&block)
  end

  def pick_up_speed
    self.speed += 10
  end

  def stop
    self.speed = 0
  end

  def attach_wagon(wagon)
    wagons << wagon if speed.zero?
  end

  def unhook_wagon(wagon)
    wagons.delete(wagon) if speed.zero? && !wagons.emty?
  end

  def route=(route)
    @route = route
    route.stations.first.accept_train(self)
  end

  def current_station
    route.stations.find { |station| station.trains.include?(self) }
  end

  def next_station
    index_current_station + 1 >= route.stations.size ? route.stations[0] : route.stations[index_current_station + 1]
  end

  def previous_station
    route.stations[index_current_station - 1]
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

  # этот метод не нужен для управления поезда

  def index_current_station
    route.stations.index(current_station)
  end
end

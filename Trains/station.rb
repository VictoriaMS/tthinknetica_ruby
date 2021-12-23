class Station
include Validation

  @@stations = []

  def self.all
    @@stations
  end
  
  attr_accessor :trains, :name

  validate :name, :presence
  validate :name, :type, String

  def initialize(name)
    @name = name
    @trains = []
    validate!
    @@stations << self
  end

  def trains_of_type(type)
    trains.map { |train| train.instance_of?(type) }
  end

  def send_train(train)
    trains.delete(train)
  end

  def accept_train(train)
    trains.push(train)
  end

  def each_train
    trains.each(&block)
  end
end

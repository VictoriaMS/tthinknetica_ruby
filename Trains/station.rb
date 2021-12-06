class Station
  @@stations = []

  def self.all
    @@stations
  end

  attr_accessor :trains, :name


  def initialize(name)
    @name = name 
    @trains = []
    @@stations << self
  end

  def all_trains
    trains
  end 

  def trains_of_type(type)
    trains.map{|train| train.class == type }
  end 

  def send_train(train)
    trains.delete(train)
  end 

  def accept_train(train)
    trains.push(train)
  end 

end

class Station
  @@stations = []

  def self.all
    @@stations
  end

  attr_accessor :trains, :name


  def initialize(name)
    @name = name 
    @trains = []
    validate!
    @@stations << self
  end

  def valid?
    validate! 
  rescue 
    false
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

  def each_train(&block)
    trains.each{|train| yield(train)}
  end

  private

  def validate!
    raise 'Station name too short' if name.length < 3 
    true
  end

end

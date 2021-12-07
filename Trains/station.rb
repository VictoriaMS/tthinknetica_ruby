class Station
  attr_accessor :trains

  def initialize(name)
    @name = name 
    @trains = []
  end
  
  def accept_train(train)
    trains.push(train)
  end 

  def trains_of_type(type)
    trains.select{|train| train.type == type }
  end 

  def send_train(train)
    trains.delete(train)
  end 
end

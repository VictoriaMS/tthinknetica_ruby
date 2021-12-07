class CargoWagon < Wagon
  attr_reader :volume
  attr_accessor :filled_volume

  def initialize(volume)
    super()
    @volume = volume
    @filled_volume = 0 
  end

  def fill_the_volume(volume)
    self.filled_volume += volume
  end

  def free_volume
    volume - filled_volume
  end

end

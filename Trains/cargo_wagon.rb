class CargoWagon < Wagon
  attr_reader :volume
  attr_accessor :filled_volume

  def initialize(volume)
    super()
    @volume = volume
    validate!
    @filled_volume = 0 
  end

  def valid?
    validate!
    true
  rescue 
    false
  end

  def fill_the_volume(volume)
    self.filled_volume += volume
  end

  def free_volume
    volume - filled_volume
  end

  private

  def validate!
    raise 'Volume can not be zero' if valome.zero?
  end

end
